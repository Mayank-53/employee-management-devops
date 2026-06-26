from sqlalchemy.orm import Session

from app.repositories.employee_repository import EmployeeRepository
from app.schemas.employee import EmployeeCreate


class EmployeeService:

    @staticmethod
    def create_employee(
        db: Session,
        employee: EmployeeCreate
    ):

        return EmployeeRepository.create(
            db,
            employee
        )

    @staticmethod
    def get_employees(
        db: Session
    ):

        return EmployeeRepository.get_all(db)

    @staticmethod
    def get_employee(
        db: Session,
        employee_id: int
    ):

        return EmployeeRepository.get_by_id(
            db,
            employee_id
        )

    @staticmethod
    def delete_employee(
        db: Session,
        employee
    ):

        EmployeeRepository.delete(
            db,
            employee
        )
