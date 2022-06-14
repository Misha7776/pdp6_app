select 'People' as table, count(*) from people
union
select 'Posts' as table, count(*) from posts
union
select 'Products' as table, count(*) from products
