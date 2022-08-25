use quanlysinhvien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select subid, subname, max(credit) as credit
from subject
group by subject.SubId, subject.SubName
having Credit >= all (select credit from subject group by subject.SubId, subject.SubName);
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select subject.subID, Subject.subName, max(mark.mark) as mark
from subject 
join mark on subject.subid = mark.subid
group by subject.subID, Subject.subName
having mark>=all(select mark from mark group by subject.subID, Subject.subName);
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select student.studentId, student.studentName, class.className, avg(mark)
from ((student
join mark on student.studentid = mark.studentid)
join class on student.classid=class.classid)
group by student.studentid, student.studentName
order by avg(mark) desc;

