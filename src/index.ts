import * as express from 'express'
import * as bodyParser from 'body-parser'

const app = express()

app.use(bodyParser.json())

app.get('/', (req, res) => {
  res.json({message: 'hello world 2'})
})

app.listen(5000)