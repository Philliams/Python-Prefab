import asyncio

import uvicorn
from fastapi import FastAPI


def dummy_function_back_end(x: str) -> str:
    """A sample docstring using pep-0257 (https://peps.python.org/pep-0257/) formatting

    :param x: a dummy string
    :type x: str

    :return: a dummy string
    :rtype: str
    """
    return x

app = FastAPI()

@app.get('/')
async def root():
    print('Sleeping for 1')
    await asyncio.sleep(1)
    print('Awake')
    return {'message': 'hello'}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)