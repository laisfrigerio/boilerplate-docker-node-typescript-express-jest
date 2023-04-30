import request from "supertest";
import app from "../app";

it("Should return a `Hello World` message", async () => {
  await request(app).get("/")
    .then((response) => {
      expect(response.status).toBe(200);
      expect(response.body.message).toBe("Hello World");
    });
});
