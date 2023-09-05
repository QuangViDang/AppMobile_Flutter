// const { Configuration, OpenAIApi } = require('openai')

// require('dotenv').config()
// const config = new Configuration({
//     apiKey: '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',
// })

// const openai = new OpenAIApi(config)

// const runPrompt = async () => {
//     const rule = process.env.RULE
//     const prompt = `
//          Return response in the following parsable JSON format speak again price and content:
       
//         {
//             "Q": "question",
//             "A": {"
//                 "answer": prive = ? (number),
//                 "content" =  xác đinh content thuộc mã nào trong đây ${rule}, 
//                 "why" = Vì sao nội dung thuộc mã đó?"
//             },
//         }
//     `

//     const response = await openai.createCompletion({
//         model: 'text-davinci-003',
//         prompt: prompt,
//         max_tokens: 2048,
//         temperature: 1,
//     })

//     const parsableJSONresponse = response.data.choices[0].text
//     const parsedResponse = JSON.parse(parsableJSONresponse)
//     console.log('Answer: ', parsedResponse.A, '\n', process.env.OPEN_AI_KEY)
// }

// runPrompt()
