import ReactOnRails from 'react-on-rails';
import NavBar from '../components/NavBar';
import Modal from '../components/Modal';
import Signup from '../components/Signup';
import Login from '../components/Login';
import LoggedInMenu from '../components/LoggedInMenu';
import Main from '../components/Main';

ReactOnRails.register({
  Main,
  NavBar,
  Modal,
  Signup,
  Login,
  LoggedInMenu
});
