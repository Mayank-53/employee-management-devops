from pydantic import BaseModel, EmailStr


class EmployeeCreate(BaseModel):
    name: str
    email: EmailStr
    designation: str


class EmployeeResponse(BaseModel):
    id: int
    name: str
    email: EmailStr
    designation: str

    model_config = {
        "from_attributes": True
    }
