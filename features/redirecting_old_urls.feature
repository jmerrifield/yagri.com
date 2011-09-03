Feature: Redirecting old URL's
    Blog posts that were copied across from the old BlogEngine.net platform should be accessible by whatever URL's they were previously available on.

    Scenario Outline: Visiting a Guid-based permalink
        When I browse to "/yagri/blog/post.aspx?id=<guid>"
        Then the post title should be "<post_title>"
        And I should be on URL "<new_url>"

        Examples: 
            | guid                                 | new_url                                                             | post_title                                              |
            | 4858c45d-cf3d-4d96-8bea-7c4ede768e2b | /2010/01/26/Jon-starts-a-tech-blog                                  | Jon starts a tech blog                                  |
            | c9c54a9f-927b-4908-be18-5391e6945304 | /2010/01/27/Form-Control-Naming-Conventions                         | Form Control Naming Conventions                         |
            | d4b48f48-1bb9-4519-988f-c8ebf56638dd | /2010/01/29/LINQ-to-SQL-Unspecified-Error-and-missing-designer-file | LINQ to SQL Unspecified Error and missing designer file |
            | d23719a1-8bfc-48e1-9896-c7c185ae3479 | /2010/02/01/Visualising-Complex-Structures-With-GraphViz            | Visualising Complex Structures With GraphViz            |
            | 59da6dcd-9072-4e83-93f9-098f0e3aed48 | /2010/02/17/Readable-String-Concatenation                           | Readable String Concatenation                           |
            | 3a008a6f-82ac-44c1-9bb3-771f1abbf2fc | /2010/03/09/Rendering-Text-with-ASP.NET                             | Rendering Text with ASP.NET                             |
