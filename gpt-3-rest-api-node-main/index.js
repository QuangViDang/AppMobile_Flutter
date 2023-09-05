const express = require('express')
require('dotenv').config()
const { Configuration, OpenAIApi } = require('openai')

const app = express()

app.use(express.json())

const configuration = new Configuration({
    apiKey: process.env.OPEN_AI_KEY_2,
})

const openai = new OpenAIApi(configuration)

app.post('/find-complexity', async (req, res) => {
    try {
        const rule = process.env.RULE
        const { prompt } = req.body
        const response = await openai.createCompletion({
            model: 'text-davinci-003',
            prompt: `
            ${prompt}. Return response in the following parsable JSON format speak again price and content:
       
            {
                "Q": "question",
                "A": {"
                    "answer": prive = ? (number),
                    "content" =  xác đinh content thuộc mã nào trong đây ${rule}, 
                    "why" = Vì sao nội dung thuộc mã đó?"
                },
            }
            `,
            max_tokens: 2048,
            temperature: 1,
        })

        const parsableJSONresponse = response.data.choices[0].text
        const parsedResponse = JSON.parse(parsableJSONresponse)
        return res.status(200).json({
            success: true,
            data: [parsedResponse.Q, parsedResponse.A],
        })
    } catch (error) {
        return res.status(400).json({
            success: false,
            error: error.response
                ? error.response.data
                : 'There was an issue on the server',
        })
    }
})

const port = process.env.PORT || 5000

app.listen(port, () => console.log(`Server listening on port ${port}`))
