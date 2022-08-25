use quanlysinhvien;
-- Hiển thị số lượng sinh viên ở từng nơi
select Address, count(StudentId) as 'So luong hoc vien'
from Student
group by Address;
-- Tính điểm trung bình các môn học của mỗi học viên
select student.studentId, student.studentName, AVG(mark.Mark)
from student join mark on student.studentID=Mark.studentid
group by student.studentid, student.studentName;
-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
select student.studentid, student.studentname, avg(mark.mark)
from student join mark on student.studentid = mark.studentid
group by student.studentid, student.studentName
having avg(mark.mark)>15;
-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
select student.studentid , student.studentname, avg(mark)
from student join mark on student.studentid = mark.studentid
group by student.studentid, student.studentname
having avg(mark)>=all (select avg(mark) from mark group by mark.studentid);