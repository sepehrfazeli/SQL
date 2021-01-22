create table page (
  id integer primary key,
  chapter_id integer references 
  chapter(id),
  content text,
  header varchar(20),
  footer varchar(20)
);
alter table chapter 
drop column content;

select constraint_name, table_name, column_name
from information_schema.key_column_usage
where table_name = 'page';

INSERT INTO book VALUES (
  'Learn PostgreSQL',
  '0-9673-4537-5',
  100,
  2.99,
  'Dive into Postgres for Beginners',
  'Codecademy Publishing'
);

INSERT INTO book VALUES (
  'Postgres Made Easy',
  '0-3414-4116-3',
  255,
  5.99,
  'Learn Postgres the Easy Way',
  'Codecademy Press'
);

INSERT INTO chapter VALUES (
  1,
  '0-9673-4537-5',
  1,
  'Chapter 1'
);

INSERT INTO chapter VALUES (
  2,
  '0-3414-4116-3',
  1,
  'Chapter 1'
);

INSERT INTO page VALUES (
  1,
  1,
  'Chapter 1 Page 1',
  'Page 1 Header',
  'Page 1 Footer'
);

INSERT INTO page VALUES (
  2,
  1,
  'Chapter 1 Page 2',
  'Page 2 Header',
  'Page 2 Footer'
);

INSERT INTO page VALUES (
  3,
  2,
  'Chapter 1 Page 1',
  'Page 1 Header',
  'Page 1 Footer'
);

INSERT INTO page VALUES (
  4,
  2,
  'Chapter 1 Page 2',
  'Page 2 Header',
  'Page 2 Footer'
);

with joined as (
select 
chapter.title as chapter_title, 
page.content as page_content,
chapter.book_isbn
from chapter
join page
  on chapter.id = page.chapter_id
)
select 
book.title as book_title , 
joined.chapter_title,
joined.page_content
from book
join joined
  on joined.book_isbn = book.isbn;


select 
book.title as book_title,
chapter.title as chapter_title, 
page.content as page_content
from book
join chapter
  on chapter.book_isbn = book.isbn
join page
  on chapter.id = page.chapter_id;






