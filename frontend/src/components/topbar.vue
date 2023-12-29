<template>
    <div id="content">
  
      <!-- Topbar -->
<nav class="navbar navbar-expand navbar bg-black topbar mb-4 static-top shadow">
      
        <!-- Sidebar Toggle (Topbar) -->
        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
          <i class="fa fa-bars"></i>
        </button>
  
        <!-- Topbar Search -->

          <div class="input-group">
          </div>


        <!-- Bell Icon -->
  <div>
    <!-- Bell button with notification dropdown -->
    <div class="notification-container">
      <button @click="toggleNotificationDropdown">  
        <i class="fa fa-bell"></i> Notification
        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-bell-fill" viewBox="0 0 20 19">
          <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zm.995-14.901a1 1 0 1 0-1.99 0A5.002 5.002 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901z"/>
        </svg>
      </button>
      <div class="notification-dropdown" v-if="showNotificationDropdown">
        <div v-if="notifications.length === 0">No new notifications</div>
        <ul v-else>
          <li v-for="(notification, index) in notifications" :key="index">
            {{ notification.message }}
          </li>
        </ul>
      </div>
    </div>
  </div>
      </nav>
<!-- End of Topbar -->

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
    </div>

    <!-- Content Row -->
 

    <!-- Content Row -->

    <div class="row">
       <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Welcome to Administrator Dashboard</h6>
                </div>
                <div class="card-body">
                    <div class="text-center">
                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;"
                            src="https://pro97472804-pic2.ysjianzhan.cn/upload/lzkt.png" alt="...">
                    </div>
                    <p style = "text-align: center;"> As an administrator, you are an essential part of our mission to revolutionize the <br>
                       way people experience urban transportation. 
                      Your role is pivotal in ensuring the smooth operation of our eBike services and maintaining the high standards of quality and efficiency that NWOW eBike is known for.</p>
                    <a target="_blank" rel="nofollow" href="https://www.nwow.com.ph/">NWOW Philipines Website &rarr;</a>
                </div>
            </div>

        <!-- Area Chart -->
        

      
    </div>


</div>
<!-- /.container-fluid -->

</div>
</template>
<script>
export default {
  data() {
    return {
      showNotificationDropdown: false,
      notifications: [],
    };
  },
  methods: {
    toggleNotificationDropdown() {
      this.showNotificationDropdown = !this.showNotificationDropdown;
    },
    showNotification() {
      // Assume this is called when a new notification is received
      const newNotification = {
        message: "This is a new notification!",
      };

      // Add the new notification to the list
      this.notifications.unshift(newNotification);

      // Check if the browser supports the Notification API
      if (!("Notification" in window)) {
        alert("This browser does not support desktop notification");
      } else if (Notification.permission === "granted") {
        // If permission is already granted, show the notification
        this.createNotification(newNotification);
      } else if (Notification.permission !== "denied") {
        // Request permission from the user
        Notification.requestPermission().then(permission => {
          if (permission === "granted") {
            this.createNotification(newNotification);
          }
        });
      }
    },
    createNotification(notification) {
      // Create a new notification
      const notificationInstance = new Notification("Vue.js Notification", {
        body: notification.message,
      });

      // You can also handle click events on the notification
      notificationInstance.onclick = () => {
        console.log("Notification clicked");
      };
    },
  },
};
</script>

<style>
.notification-container {
  position: relative;
}

.notification-dropdown {
  position: absolute;
  top: 100%;
  right: 0;
  background-color: #fff;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(255, 255, 255, 0.1);
  padding: 10px;
  display: none;
}

.notification-container:hover .notification-dropdown {
  display: block;
}
</style>