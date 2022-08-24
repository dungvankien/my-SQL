use quanlysinhvien;
select *
from student;
select *
from student
where Status=true;
select *
from subject
where Credit<10;
select S.StudentId, S.StudentName, C.ClassName
from Student  S join Class C on S.classid=C.classid;
select S.StudentId, S.StudentName, C.ClassName
from student S join class C on S.ClassID=C.ClassId
where C.className='A1';
select S.Studentid, S.StudentName, Sub.SubName, M.Mark
from student S join	Mark M on S.StudentID=m.Studentid join Subject sub on m.subid= sub.subid;
select S.Studentid, S.StudentName, Sub.SubName, M.Mark
from student S join	Mark M on S.StudentID=m.Studentid join Subject sub on m.subid= sub.subid
where sub.Subname='CF';
