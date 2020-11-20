package com.edu.bean;


public class EmployeeExtend extends Employee {
    private Department department;

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

}