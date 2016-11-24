(function (){

    var SeatBox = React.createClass({
        getInitialState: function() {
            return {
                data: [],
                data2: [],
            };
        },
        componentDidMount: function() {
            console.log('父组件：异步获取数据前 ReactDOM.findDOMNode(this)',ReactDOM.findDOMNode(this))
            $.ajax({
                url: this.props.url,
                dataType: 'json',
                cache: false,
                success: function(data) {
                    //console.log('父组件：异步获取数据 ReactDOM.findDOMNode(this)',ReactDOM.findDOMNode(this))

                    this.setState({data: data.sections[0].seatRows});
                }.bind(this),
                error: function(xhr, status, err) {
                    console.error(this.props.url, status, err.toString());
                }.bind(this)
            });
        },
        handleCommentSubmit: function(comment) {
            //console.log(comment)
            // TODO: submit to the server and refresh the list
            this.setState({data: []});

        },
        handleOnSeatActive:function(data){
            var oDate = this.state.data2;
            //console.log(data);
            //console.log(this);
            var newArr = oDate.concat([data]);
            this.setState({data2: newArr});
        },
        render: function() {
            return (
                <div className="seat-box">
                    <h1>潘珍玉</h1>
                    <SeatList onSeatActive={this.handleOnSeatActive} data={this.state.data} />
                    <SeatForm onCommentSubmit={this.handleCommentSubmit}  data={this.state.data2} />
                </div>
            );
        }
    });


    var SeatList = React.createClass({
        getInitialState: function() {
            return {
                hbDrag: '',
            };
        },
        componentDidMount:function(){
            //console.log(this);
            //console.log('子组件 ReactDOM.findDOMNode(this)',ReactDOM.findDOMNode(this));
            //var $checkboxContainer = $(this.refs.checkboxContainer.getDOMNode());
            //console.log('子组件 refs.checkboxContainer.getDOMNode()',this.refs.checkboxContainer);
        },
        componentDidUpdate: function() {
            console.log('子组件 componentDidUpdate ReactDOM.findDOMNode(this)',ReactDOM.findDOMNode(this));
            //jquery插件
            if(!this.state.hbDrag){
                this.state.hbDrag=hb.drag(this.refs.checkboxContainer,{})
            }

        },
        handleOnSeatActive:function(data){
            //console.log(data);
            //console.log(this);
            this.props.onSeatActive(data);
        },

        render: function() {
            if(this.props.data){
                var commentNodes = this.props.data.map((n,i) =>{
                    return (
                        <SeatRow onSeatActive={this.handleOnSeatActive}  data={n.seats} key={i}>

                        </SeatRow>
                    );
                });
            }

            return (
                <div className="seat-list-box">
                    <div className="seat-list" ref="checkboxContainer">
                        {commentNodes}
                    </div>
                </div>

            );
        }
    });


    var SeatRow = React.createClass({
        handleOnSeatActive:function(data){
            this.props.onSeatActive(data);
        },

        render: function() {
            //console.log(this);

            var seatNodes = this.props.data.map((n,i)=> {
                return (
                    <SeatCell onSeatActive={this.handleOnSeatActive} data={n} index={i}  key={i}>
                    </SeatCell>
                );
            });
            return (
                <div className="seat-row">
                    {seatNodes}
                </div>
            );
        }
    });

    var SeatCell = React.createClass({
        getInitialState: function() {
            return {
                active: false,
            };
        },
        handleClick: function(e) {
            if(this.props.data.type=="E"){
                return
            }
            this.setState({active: !this.state.active});
            this.props.onSeatActive(this.props.data.seatNo);
        },
        render: function() {
            var btnClass = classNames({
                'seat-cell': true,
                'active': this.state.active,
                'seat-cell-no': this.props.data.type=='E',
            });
            return (
                <div className={btnClass}  onClick={this.handleClick} >
                    {this.props.data.rowId}排{this.props.data.columnId}座
                </div>
            );
        }
    });

    var SeatForm = React.createClass({
        getInitialState: function() {
            return {author: '', text: ''};
        },
        handleSubmit: function(e) {
            e.preventDefault();
            var author = this.state.author.trim();
            var text = this.state.text.trim();
            if (!text || !author) {
                return;
            }
            this.props.onCommentSubmit([]);
            // TODO: send request to the server
            this.setState([]);
        },
        render: function() {
            console.log(this.props.data)

            if(this.props.data){
                var seatNodes = this.props.data.map((n,i)=> {
                    return (
                        <div key={n}> {n} </div>
                    );
                });
                if(this.props.data.length){
                    var button =<button  type="button">立即购买</button>;
                }else{
                    var button =<button disabled="disabled" type="button">立即购买</button>;
                }
            }


            return (
                <div className="commentForm" >
                    <br/>
                    <div>
                        已选座位：{seatNodes}
                    </div>
                    <br/>
                    {button}
                </div>
            );
        }
    });
    ReactDOM.render(
        <SeatBox url="http://10.0.1.29:1111/seat"   />,
        document.getElementById('example')
    );

}());

