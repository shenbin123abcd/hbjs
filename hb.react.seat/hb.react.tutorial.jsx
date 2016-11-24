(function (){
    var arr=[1,2,3,4]
    var data = [
        {id: 1, author: "Pete Hunt", text: "This is one comment"},
        {id: 2, author: "wwwwwJordewan Walk", text: "This is *another* comment"}
    ];

    var CommentBox = React.createClass({
        getInitialState: function() {
            return {data: []};
        },
        componentDidMount: function() {
            $.ajax({
                url: this.props.url,
                dataType: 'json',
                cache: false,
                success: function(data) {
                    this.setState({data: data});
                }.bind(this),
                error: function(xhr, status, err) {
                    console.error(this.props.url, status, err.toString());
                }.bind(this)
            });
        },
        handleCommentSubmit: function(comment) {
            console.log(comment)
            // TODO: submit to the server and refresh the list

            this.setState({data: [
                {id: 1, author: "232342", text: "23434"},
            ]});

        },
        render: function() {
            return (
                <div className="commentBox">
                    <h1>Comments</h1>
                    <CommentList data={this.state.data} />
                    <CommentForm onCommentSubmit={this.handleCommentSubmit} />
                </div>
            );
        }
    });


    var CommentList = React.createClass({

        render: function() {
            var commentNodes = this.props.data.map(function(comment) {
                return (
                    <Comment author={comment.author} key={comment.id}>
                        {comment.text}
                    </Comment>

                );
            });
            return (
                <div className="commentList">
                    {commentNodes}
                </div>
            );
        }
    });

    var CommentForm = React.createClass({
        getInitialState: function() {
            return {author: '', text: ''};
        },
        handleAuthorChange: function(e) {
            this.setState({author: e.target.value});
        },
        handleTextChange: function(e) {
            this.setState({text: e.target.value});
        },
        handleSubmit: function(e) {
            e.preventDefault();
            var author = this.state.author.trim();
            var text = this.state.text.trim();
            if (!text || !author) {
                return;
            }
            this.props.onCommentSubmit({author: author, text: text});
            // TODO: send request to the server
            this.setState({author: '', text: ''});
        },
        render: function() {
            return (
                <form className="commentForm" onSubmit={this.handleSubmit}>
                    <input
                        type="text"
                        placeholder="Your name"
                        value={this.state.author}
                        onChange={this.handleAuthorChange}
                    />
                    <input
                        type="text"
                        placeholder="Say something..."
                        value={this.state.text}
                        onChange={this.handleTextChange}
                    />
                    <input type="submit" value="Post" />
                </form>

            );
        }
    });

    var Comment = React.createClass({
        render: function() {
            return (
                <div className="comment">
                    <h2 className="commentAuthor">
                        {this.props.author}
                    </h2>
                    {this.props.children}
                </div>
            );
        }
    });


    ReactDOM.render(
        <CommentBox url="http://10.0.1.29:1111/reactcomment"   />,
        document.getElementById('example')
    );





}());

