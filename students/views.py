from django.shortcuts import render, redirect
from .models import Student


def student_list(request):

    if request.method == "POST":
        name = request.POST.get("name")

        if name:
            Student.objects.create(name=name)

        return redirect("student_list")

    students = Student.objects.all()

    return render(
        request,
        "students/student_list.html",
        {"students": students},
    )
