<template>
    <ul class="navbar-nav bg-black sidebar sidebar-dark accordion" id="accordionSidebar">

<!-- Sidebar - Brand -->
<a class="sidebar-brand d-flex align-items-center justify-content-center" href="/Nhome">
  <div class="sidebar-brand-icon rotate-n-15">
      <i class="fas fa-laugh-wink"></i>
  </div>
  <div class="sidebar-brand-text mx-3">NWOW E-BIKE <sup>Camilmil</sup></div>
</a>

<!-- Divider -->
<hr class="sidebar-divider my-0">

<!-- Nav Item - Dashboard -->
<li class="nav-item active">

  <a class="nav-link sidebar-heading text-white" href="/Admin">
      <i class="fas fa-fw fa-tachometer-alt"></i>
      <span>Admin Dashboard</span></a>

    

</li>

<!-- Divider -->
<hr class="sidebar-divider">

<!-- Heading -->


<!-- Nav Item - Pages Collapse Menu -->
<li class="nav-item">

  <a class="nav-link collapsed sidebar-heading text-white" href="#" data-toggle="collapse" data-target="#collapseTwo"
      aria-expanded="true" aria-controls="collapseTwo">
      <i class="fas fa-fw fa-cog "></i>
      <span style="font-size: 13px; color: white;">Inventory Management</span>
  </a>
  <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
      <div class="bg-white py-2 collapse-inner rounded">
          <h6 class="collapse-header">Inventory</h6>
          <a class="collapse-item" href="/products">Products</a>
      </div>
  </div>

    

</li>

<li class="nav-item">

<a class="nav-link collapsed sidebar-heading text-white" href="#" data-toggle="collapse" data-target="#collapseTw"
    aria-expanded="true" aria-controls="collapseTw">
    <i class="fas fa-fw fa-cog "></i>
    <span style="font-size: 13px; color: white;">Staff Management</span>
</a>
<div id="collapseTw" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
    <div class="bg-white py-2 collapse-inner rounded">
        <h6 class="collapse-header">Staff Task</h6>
  
        <a class="collapse-item" href="/AddAssignment">Staff Assignment Service</a>

    </div>
</div>

  

</li>

<!-- Nav Item - Utilities Collapse Menu -->
<li class="nav-item">

    <a class="nav-link collapsed sidebar-heading text-white" href="#" data-toggle="collapse" data-target="#collapseUtilities"
        aria-expanded="true" aria-controls="collapseUtilities">
        <i class="fas fa-fw fa-wrench"></i>
        <span style="font-size: 13px; color: white;">Sales Management</span>
    </a>
    <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
        data-parent="#accordionSidebar">
       
    </div>
  
  <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
      data-parent="#accordionSidebar">
      <div class="bg-white py-2 collapse-inner rounded">
          <h6 class="collapse-header">Sales Management:</h6>
          <a class="collapse-item" href="/Invoice">Sales</a>
          
      </div>
  </div>


</li>

<!-- Sidebar Toggler (Sidebar) -->
<div class="text-center d-md-inline">
  <button class="rounded-circle border-0">☼</button>
</div>
</ul>
</template>
