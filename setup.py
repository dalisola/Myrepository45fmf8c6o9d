from setuptools import setup, find_packages

VERSION = "0.0.1"
DESCRIPTION = "Ask IF db model"
LONGS_DESCRIPTION = "model for db"


setup(
    name="dbapp",
    version=VERSION,
    author="Dali",
    author_email="mohamed.ali.sola@gmail.com",
    description=DESCRIPTION,
    long_description=LONGS_DESCRIPTION,
    include_package_data=True,
    packages=find_packages(),
    install_requires=[
        "sqlalchemy-aurora-data-api",
        "fastapi",
        "uvicorn",
        "sqlalchemy"
    ]
)