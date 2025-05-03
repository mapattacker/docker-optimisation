from fastapi import FastAPI

# Create the FastAPI app instance
app = FastAPI()

# Define a route for the root endpoint
@app.get("/")
def read_root():
    return {"message": "Hello, FastAPI!"}
