import e, { Router, Request, Response } from "express";
import { db } from "../db";
import { eq } from "drizzle-orm";
import { NewUser, users } from "../db/schema";
import bcryptjs from "bcryptjs";

const authRouter = Router();

interface SignUpBody {
    name: string,
    email: string,
    password: string
}
interface LogInBody{
    email:string,
    password:string
}

authRouter.post("/signup", async (req: Request<{}, {}, SignUpBody>, res: Response) => {
    try {
        //get request body
        const { name, email, password } = req.body;
        //check if user already exists
        const existingUser = await db
            .select()
            .from(users)
            .where(eq(users.email, email));
        if (existingUser.length){
            res.status(400).json({msg:"User with the same email already exists"});
            return;
        }
        //hashed password
        const hashedPassword = await bcryptjs.hash(password,8);   
        //create a new user and store it in the database

        const newUser:NewUser = {name,email,password:hashedPassword};
      const [user] =  await db.insert(users).values(newUser).returning();
      res.status(201).json(user);                       
    } catch (e: any) {
  console.error("Signup error:", e);
  res.status(500).json({ error: e.message || "Internal server error" });
}
});
authRouter.post("/login", async (req: Request<{}, {}, LogInBody>, res: Response) => {
    try {
        //get request body
        const { email, password } = req.body;
        //check if user already exists
        const [existingUser] = await db
            .select()
            .from(users)
            .where(eq(users.email, email));
        if (!existingUser){
            res.status(400).json({msg:"User with the same email doesn't exist"});
            return;
        }
        //hashed password
        const isMatch = await bcryptjs.compare(password,existingUser.password);   
        //create a new user and store it in the database

        if (!isMatch) {
           res.status(400).json({msg: "Incorrect password"});
           return;
        }


     
      res.json(existingUser);                       
    } catch (e: any) {
  console.error("Signup error:", e);
  res.status(500).json({ error: e.message || "Internal server error" });
}
});

authRouter.get("/", (req, res) => {
    res.send(" Hi there from auth!")
});

export default authRouter;