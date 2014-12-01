    <form action="/post/<%=post.id%>" method="post">
    <input type ="hidden" name="_method" value="PUT"/>
    <br/>
    <input type="text" class="fixwidth" placeholder="Blog Title" name="post[title]" value="<%=@post.title%>"</br></br></br></br>
    Blog Post:</br></br>
    <input type="text" id="blogpost" class="fixwidth" placeholder="What quirky thing happened in your life today?" name="post[body]" value="<%=@post.title%>"><br><br>
    <label for="post_tags">Tags:</label>
    <input id="post_tags" name="post[unsorted_tags]" value="tag1, tag2, some other tag, a fourth tag">
    <input type="submit" value="Update"><br><br>
  </form>

      <% @tag_array = []%>
    <% @tag_array = @post.unsorted_tags.split(', ') %>
    <% @tag_array.each do |t|%>
    <a href= "/tag/<%=t%>"><%=t%></a>
    <%end%>