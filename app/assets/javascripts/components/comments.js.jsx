var CommentBox = React.createClass({
  
  getInitialState: function() {
    return { list: [] };
  },
  
  componentDidMount: function() {
    this.serverRequest = $.get('/comments/for_product/' + this.props.product_id, function(data){
      this.setState({ list: data });
    }.bind(this));
  },
  
  commentPostHandler: function(message) {
    that=this;
    $.post('/comments.json', {comment: { comment: message, product_id: this.props.product_id }})
    .done(function(data){
      that.state.list.push(data);
      that.setState({ list: that.state.list });
    });
  },
  
  render: function() {
    return (
      <div className="commentBox">
        <CommentForm product_id={this.props.product_id} submitComment={this.commentPostHandler}/>
        <CommentList product_id={this.props.product_id} list={this.state.list} />
      </div>
    );
  }
});

var CommentForm = React.createClass({
  getInitialState: function() {
    return { message:'' }
  },
  
  onChange: function(e) {
    this.setState({message: e.target.value});
  },
  
  submitHandler: function(e) {
    e.preventDefault();
    this.props.submitComment(this.state.message);
    
    this.setState({message: ''});
  },
  
  render: function() {
    return(
      <form onSubmit={this.submitHandler}>
        <input onChange={this.onChange} value={this.state.message} placeholder="Digite seu comentário"/>
        <input type="submit"/>
      </form>
    );
  }
});

var CommentList = React.createClass({
  
  render: function() {
    var comments = this.props.list.map(function(comment){
      return(
        <li key={comment.id}>{comment.first_name} {comment.last_name}<br />
            {comment.comment}</li>
        );
    });
    
    return(
      <ul>
        {comments}
      </ul>
    );
  }
})