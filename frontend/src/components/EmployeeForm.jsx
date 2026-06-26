import { useState } from "react";
import { createEmployee } from "../api/employeeApi";

function EmployeeForm({ onEmployeeCreated }) {
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    designation: "",
  });

  async function handleSubmit(e) {
    e.preventDefault();

    await createEmployee(formData);

    setFormData({
      name: "",
      email: "",
      designation: "",
    });

    onEmployeeCreated();
  }

  return (
    <form onSubmit={handleSubmit}>
      <h2>Add Employee</h2>

      <input
        placeholder="Name"
        value={formData.name}
        onChange={(e) =>
          setFormData({
            ...formData,
            name: e.target.value,
          })
        }
      />

      <input
        placeholder="Email"
        value={formData.email}
        onChange={(e) =>
          setFormData({
            ...formData,
            email: e.target.value,
          })
        }
      />

      <input
        placeholder="Designation"
        value={formData.designation}
        onChange={(e) =>
          setFormData({
            ...formData,
            designation: e.target.value,
          })
        }
      />

      <button type="submit">
        Create Employee
      </button>
    </form>
  );
}

export default EmployeeForm;
