"use strict";

import express from "express";
import cors from "cors";
import { prisma } from "./lib/prisma.ts";

let app = express();
app.use(cors({ origin:'http://community.ct.ws/' }));

app.use(express.json());

let port = 8000;



// Register User
app.post('/api/register',async(req,res)=>{
try {

    let { name,profile } = req.body;
  if(!name || !profile){
    return res.status(400).json({message:"please check Your Data"});
  }
  let get = await prisma.chats.create({
    data:{
      name:name,
      profile:profile
    }
  })
  res.status(201).json({
    message:'successFull Created Acount',
    get
  })

} catch (error) {
  console.log(error)
  res.status(500).send(error)
}
});





// Read Data App Chat
app.get('/api/read',async(req,res)=>{
  try {
    res.status(200).send( await prisma.chats.findMany())
  } catch (error) {
    console.log(error);
    res.status(500).send(error)
  }
})







// API messages 
app.post('/api/messages',async(req,res)=>{
try {
  let {message}=req.body;
  if(!message){return res.status(400).json({message:'please Check Your data'})}
  let sended = await prisma.messages.create({
    data:{
      message
    }
  })
  res.status(201).json({
    message:"successFull Send Message",
    message
  })
} catch (error) {
  res.status(500).send(error)
  console.log(error)
}
})








// Read All Message
app.get('/api/read/messages',async(req,res)=>{
  try {
    res.status(200).send(await prisma.messages.findMany())
  } catch (error) {
    res.status(500).send(error)
    console.log(error)
  }
})











// app.put("/api/update/:id", async (req, res) => {
//   try {
//     let { name } = req.body;
//     let id = Number(req.params.id);

//     if (!id) {
//       return res.status(404).send("Not Found ID: "+req.params.id);
//     }

//     let done = await prisma.ebyan.update({
//       where: {
//         id
//       },
//       data: {
//         name,
//       },
//     });

//     res.status(200).json({
//       message: `seccessFull updated Name to: ${req.body.name}`,
//       done,
//     });

//   } catch (error) {
//     res.status(500).send(error);
//     console.error(error);
//   }
// });


// app.delete('/api/remove/:id', async (req, res) => {
//     try {
//         const id = req.params.id;

//         if (!id) {
//             return res.status(400).json({ message: "there is Error" });
//         }

//         let removed = await prisma.ebyan.delete({
//             where: {
//                 id: +id
//             }
//         });

           

//         res.status(200).json({
//             message: `Successfully Removed ID: ${id}`,
//             data: removed
//         });

//     } catch (error) {
//         console.error(error);
//         res.status(500).json({ error: error.message });
//     }
// });



app.use(function (req, res) {
  res.status(404).send(`page: ${req.url} Not Found 404`);
});

app.listen(port, function () {
  console.log(`http://localhost:${port}`);
});
