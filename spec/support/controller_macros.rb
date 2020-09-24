module ControllerMacros
  def teacher_login(teacher)
    @request.env["devise.mapping"] = Devise.mappings[:teacher]
    sign_in teacher
  end

  def student_login(student)
    @request.env["devise.mapping"] = Devise.mappings[:student]
    sign_in student
  end
end
