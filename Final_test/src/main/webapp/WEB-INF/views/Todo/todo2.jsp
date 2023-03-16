<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html><html lang='en' class=''>
<head><script src='//production-assets.codepen.io/assets/editor/live/console_runner-079c09a0e3b9ff743e39ee2d5637b9216b3545af0de366d4b9aad9dc87e26bfd.js'></script><script src='//production-assets.codepen.io/assets/editor/live/events_runner-73716630c22bbc8cff4bd0f07b135f00a0bdc5d14629260c3ec49e5606f98fdd.js'></script><script src='//production-assets.codepen.io/assets/editor/live/css_live_reload_init-2c0dc5167d60a5af3ee189d570b1835129687ea2a61bee3513dee3a50c115a77.js'></script><meta charset='UTF-8'><meta name="robots" content="noindex"><link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" /><link rel="mask-icon" type="" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" /><link rel="canonical" href="https://codepen.io/tureey/pen/gGWKLE?depth=everything&order=popularity&page=61&q=react&show_forks=false" />

<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
<style class="cp-pen-styles">body {
  background: white;
}

.app_footer {
  text-align: center;
  margin-top: 45px;
  font-family: "Lato", helvetica, Arial, Sans-serif;
}

.board {
  display: flex;
  flex-wrap: nowrap;
  justify-content: space-around;
  padding: 15px;
  min-width: 1000px;
  width: 80%;
  margin: 0 auto;
  align-content: strech;
}

.boardColumn {
  font-family: "Lato", helvetica, Arial, Sans-serif;
  flex-basis: 300px;
  flex-grow: 1;
  margin: 0 5px;
}
.boardColumn .boardColumn__header {
  padding: 5px;
  margin-bottom: 10px;
  border-bottom: 5px solid #f5f5f5;
}
.boardColumn .boardColumn__title {
  font-size: 16px;
  text-transform: capitalize;
  font-weight: 600;
  margin: 0;
  color: #333;
  font-size: 14px;
  line-height: 1.5;
  font-weight: normal;
  margin: 0 5px 0 0;
  word-wrap: break-word;
}
.boardColumn .boardColumn__taskList {
  background: #f5f5f5;
  padding: 20px 10px;
  min-height: 600px;
  height: 600px;
  max-height: 600px;
  overflow-y: auto;
}

.boardColumn.boardColumn--DONE .taskCard {
  opacity: 0.7;
}
.boardColumn.boardColumn--DONE .taskCard .taskCard__title {
  text-decoration: line-through;
}

.taskCard {
  font-family: "Lato", helvetica, Arial, Sans-serif;
  border: 1px solid #E0E1E2;
  border-radius: 5px;
  padding: 15px 15px 10px 15px;
  background: white;
  position: relative;
  margin-bottom: 5px;
  box-shadow: 0px 3px 4px 0px rgba(0, 0, 0, 0.06);
}
.taskCard:hover {
  cursor: pointer;
}
.taskCard:after {
  content: "";
  position: absolute;
  top: 5px;
  bottom: 5px;
  left: 5px;
  width: 4px;
  background: red;
  border-top-left-radius: 5px;
  border-bottom-left-radius: 5px;
}
.taskCard .taskCard__title {
  margin: 0;
  color: #333;
  font-weight: 500;
  letter-spacing: 0.5px;
}
.taskCard .taskCard__epicLink-title {
  background: #9b59b6;
  padding: 3px 10px;
  font-size: 13px;
  border-radius: 5px;
  color: white;
}
.taskCard .taskCard__footer {
  display: flex;
  margin-top: 15px;
  justify-content: space-between;
  align-items: center;
}
.taskCard .taskCard__type {
  font-size: 12px;
  font-weight: bold;
}
.taskCard .taskCard__id {
  font-size: 12px;
  font-weight: 300;
  color: #CDCED0;
  margin-right: 10px;
  font-variant: small-caps;
  font-weight: 500;
}
.taskCard .taskCard__avatar {
  width: 20px;
  height: 20px;
  border-radius: 500px;
}
.taskCard .taskCard__id, .taskCard .taskCard__avatar {
  vertical-align: middle;
}

.taskCard.taskCard--HIGHEST:after {
  background: #e74c3c;
}
.taskCard.taskCard--HIGHEST .taskCard__type {
  color: #e74c3c;
}

.taskCard.taskCard--HIGH:after {
  background: #e67e22;
}
.taskCard.taskCard--HIGH .taskCard__type {
  color: #e67e22;
}

.taskCard.taskCard--MEDIUM:after {
  background: #f1c40f;
}
.taskCard.taskCard--MEDIUM .taskCard__type {
  color: #f1c40f;
}

.taskCard.taskCard--LOW:after {
  background: #27ae60;
}
.taskCard.taskCard--LOW .taskCard__type {
  color: #27ae60;
}
</style></head><body>
<div id="app"></div>
<script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script><script src='https://cdnjs.cloudflare.com/ajax/libs/react/15.6.1/react.min.js'></script><script src='https://cdnjs.cloudflare.com/ajax/libs/react/15.6.1/react-dom.min.js'></script><script src='https://cdnjs.cloudflare.com/ajax/libs/styled-components/2.1.2/styled-components.min.js'></script><script src='https://npmcdn.com/react-draggable'></script><script src='https://unpkg.com/react-modal@1.6.2/dist/react-modal.min.js'></script>
<script >'use strict';

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (!self) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return call && (typeof call === "object" || typeof call === "function") ? call : self; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

// PRIORITIES
var PRIORITY_HIGHEST = 'HIGHEST';
var PRIORITY_HIGH = 'HIGH';
var PRIORITY_MEDIUM = 'MEDIUM';
var PRIORITY_LOW = 'LOW';
var PRIORITY_TRIVIAL = 'TRIVIAL';
// STATUS
var TYPE_TODO = 'TODO';
var TYPE_INPROGRESS = 'INPROGRESS';
var TYPE_DONE = 'DONE';
// TITLES
var TITLE_TODO = 'To do';
var TITLE_INPROGRESS = 'In Progress';
var TITLE_DONE = 'Done';
// TASK
var CLASS_TASK = 'taskCard';
var CLASS_COLUMN = 'boardColumn';

// GENERAL JSON
var data = {
	tasks: [{
		id: 'REACT-1',
		priority: PRIORITY_HIGHEST,
		title: 'Read WebPack documentation',
		epicLink: 'React buidings',
		status: TYPE_DONE,
		points: 3
	}, {
		id: 'REACT-2',
		priority: PRIORITY_HIGHEST,
		title: 'Install dependencies',
		epicLink: 'React buidings',
		status: TYPE_DONE,
		points: 3
	}, {
		id: 'REACT-3',
		priority: PRIORITY_HIGH,
		title: 'Try Hello world',
		epicLink: 'React buidings',
		status: TYPE_DONE
	}, {
		id: 'REACT-4',
		priority: PRIORITY_MEDIUM,
		title: 'Create some little components',
		epicLink: 'React buidings',
		status: TYPE_INPROGRESS
	}, {
		id: 'REACT-5',
		priority: PRIORITY_MEDIUM,
		title: 'Create App with react-router',
		epicLink: 'React buidings',
		status: TYPE_TODO
	}, {
		id: 'REACT-6',
		priority: PRIORITY_MEDIUM,
		title: 'Practise styled-components (react library)',
		epicLink: 'React buidings',
		status: TYPE_TODO
	}, {
		id: 'REACT-7',
		priority: PRIORITY_LOW,
		title: 'Read Redux documentation',
		epicLink: 'React buidings',
		status: TYPE_TODO
	}, {
		id: 'REACT-8',
		priority: PRIORITY_LOW,
		title: 'Do a little project with ReduxJS',
		epicLink: 'React buidings',
		status: TYPE_TODO
	}]
};

var TaskCard = function TaskCard(task) {

	var image = 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAemAAAAJGFkOGZiYTIwLTU0YjUtNGY0Ni1hM2ZhLThlY2Y2NzU0Mzk3MA.jpg';
	var priorityclass = getPriorityClass(task.priority);

	function getPriorityClass(priority) {
		if (priority == PRIORITY_LOW) {
			return CLASS_TASK + '--' + PRIORITY_LOW;
		} else if (priority == PRIORITY_MEDIUM) {
			return CLASS_TASK + '--' + PRIORITY_MEDIUM;
		} else if (priority == PRIORITY_HIGH) {
			return CLASS_TASK + '--' + PRIORITY_HIGH;
		} else if (priority == PRIORITY_HIGHEST) {
			return CLASS_TASK + '--' + PRIORITY_HIGHEST;
		}
	}

	return React.createElement(
		'div',
		{ className: 'taskCard ' + priorityclass },
		React.createElement(
			'header',
			{ className: 'taskCard__header' },
			React.createElement(
				'h4',
				{ className: 'taskCard__title' },
				task.title
			),
			React.createElement(
				'div',
				{ className: 'taskCard__epicLink-wrapper' },
				React.createElement(
					'span',
					{ className: 'taskCard__epicLink-title' },
					task.epicLink
				)
			)
		),
		React.createElement(
			'footer',
			{ className: 'taskCard__footer' },
			React.createElement(
				'span',
				{ className: 'taskCard__type' },
				task.priority
			),
			React.createElement(
				'div',
				null,
				React.createElement(
					'span',
					{ className: 'taskCard__id' },
					task.id
				),
				React.createElement('img', { className: 'taskCard__avatar', src: image })
			)
		)
	);
};

var BoardColumn = function BoardColumn(props) {

	var columnClass = getColumnClass(props.title);
	function getColumnClass(title) {
		if (title == TITLE_TODO) {
			return CLASS_COLUMN + '--' + TYPE_TODO;
		} else if (title == TITLE_INPROGRESS) {
			return CLASS_COLUMN + '--' + TYPE_INPROGRESS;
		} else if (title == TITLE_DONE) {
			return CLASS_COLUMN + '--' + TYPE_DONE;
		}
	}

	return React.createElement(
		'div',
		{ className: 'boardColumn ' + columnClass },
		React.createElement(
			'header',
			{ className: 'boardColumn__header' },
			React.createElement(
				'h1',
				{ className: 'boardColumn__title' },
				props.title
			)
		),
		React.createElement(
			'div',
			{ className: 'boardColumn__taskList' },
			props.tasks.map(function (task) {
				return React.createElement(TaskCard, task);
			})
		)
	);
};

var Board = function (_React$Component) {
	_inherits(Board, _React$Component);

	function Board() {
		_classCallCheck(this, Board);

		var _this = _possibleConstructorReturn(this, _React$Component.call(this));

		_this.state = {
			tasks: data.tasks
		};
		return _this;
	}

	Board.prototype.render = function render() {
		return React.createElement(
			'div',
			{ className: 'board' },
			React.createElement(BoardColumn, { title: TITLE_TODO,
				tasks: this.state.tasks.filter(function (task) {
					return task.status == TYPE_TODO;
				}) }),
			React.createElement(BoardColumn, { title: TITLE_INPROGRESS,
				tasks: this.state.tasks.filter(function (task) {
					return task.status == TYPE_INPROGRESS;
				}) }),
			React.createElement(BoardColumn, { title: TITLE_DONE,
				tasks: this.state.tasks.filter(function (task) {
					return task.status == TYPE_DONE;
				}) })
		);
	};

	return Board;
}(React.Component);

var AppFooter = function AppFooter() {
	return React.createElement(
		'footer',
		{ className: 'app_footer' },
		React.createElement(
			'p',
			null,
			'You can check my ',
			React.createElement(
				'a',
				{ href: 'https://www.linkedin.com/in/victorribero/', target: '_blank' },
				'Linkedin'
			),
			' or ',
			React.createElement(
				'a',
				{ target: '_blank', href: 'http://www.wasvi.com' },
				'my website'
			)
		)
	);
};

var App = function (_React$Component2) {
	_inherits(App, _React$Component2);

	function App() {
		_classCallCheck(this, App);

		return _possibleConstructorReturn(this, _React$Component2.apply(this, arguments));
	}

	App.prototype.render = function render() {
		return React.createElement(
			'div',
			{ 'class': 'app' },
			React.createElement(Board, null),
			React.createElement(AppFooter, null)
		);
	};

	return App;
}(React.Component);

ReactDOM.render(React.createElement(App, null), document.getElementById('app'));
//# sourceURL=pen.js
</script>
</body></html>