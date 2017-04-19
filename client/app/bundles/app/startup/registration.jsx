import ReactOnRails from 'react-on-rails';
import NavBar from '../components/NavBar';
import Modal from '../components/Modal';
import Profile from '../components/Profile';
import Signup from '../components/Signup';
import Login from '../components/Login';
import LoggedInMenu from '../components/LoggedInMenu';
import Main from '../components/Main';
import NewPost from '../components/NewPost';
import Feed from '../components/Feed';

ReactOnRails.register({
  Feed,
  Main,
  NavBar,
  Modal,
  NewPost,
  Profile,
  Signup,
  Login,
  LoggedInMenu
});
