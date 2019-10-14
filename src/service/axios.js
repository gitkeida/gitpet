import Vue from 'vue';
import axios from 'axios';

axios.defaults.baseURL = 'http://119.29.67.165/mineData/data/';
// axios.defaults.baseURL = 'http://119.29.67.165/';

Vue.prototype.axios = axios;

export default axios;