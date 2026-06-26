import { useState } from "react";
import EmployeeForm from "./components/EmployeeForm";
import EmployeeList from "./components/EmployeeList";

function App() {
  const [refresh, setRefresh] = useState(false);

  function reloadEmployees() {
    setRefresh(!refresh);
  }

  return (
    <div>
      <h1>Employee Management System </h1>

      <EmployeeForm
        onEmployeeCreated={reloadEmployees}
      />

      <EmployeeList key={refresh} />
    </div>
  );
}

export default App;
