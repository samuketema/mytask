import { defineConfig } from "drizzle-kit";

export default defineConfig({
  dialect: "postgresql",
  schema: "./src/db/schema.ts",
  out: "./drizzle",
  dbCredentials: {
    host: "db",          // Docker service name
    port: 5432,
    user: "postgres",
    password: "postgres", // <-- your password here
    database: "tasksdb",
    ssl:false,
  },
});