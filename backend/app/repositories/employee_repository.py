from sqlalchemy.orm import Session

from app.models.employee import Employee
from app.schemas.employee import EmployeeCreate


class EmployeeRepository:

    @staticmethod
    def create(
        db: Session,
        employee: EmployeeCreate
    ) -> Employee:

        db_employee = Employee(
            name=employee.name,
            email=employee.email,
            designation=employee.designation
        )

        db.add(db_employee)
        db.commit()
        db.refresh(db_employee)

        return db_employee

    @staticmethod
    def get_all(db: Session):

        return db.query(Employee).all()

    @staticmethod
    def get_by_id(
        db: Session,
        employee_id: int
    ):

        return (
            db.query(Employee)
            .filter(Employee.id == employee_id)
            .first()
        )

    @staticmethod
    def delete(
        db: Session,
        employee: Employee
    ):

        db.delete(employee)
        db.commit()
