const API_URL = "/api/v1";

export async function getEmployees() {
  const response = await fetch(`${API_URL}/employees`);

  if (!response.ok) {
    throw new Error("Failed to fetch employees");
  }

  return response.json();
}

export async function createEmployee(employee) {
  const response = await fetch(`${API_URL}/employees`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(employee),
  });

  if (!response.ok) {
    const error = await response.text();
    console.error(error);
    throw new Error(error);
  }

  return response.json();
}
