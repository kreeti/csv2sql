defmodule DashboardWeb.Live.IconSvg do
  import Phoenix.LiveView.Helpers
  # https://www.reshot.com/free-svg-icons/

  @dimensions %{width: 33, height: 33}

  def args(assigns) do
    %{
      classes: Map.get(assigns, :classes, ""),
      width: Map.get(assigns, :width, @dimensions[:width]),
      height: Map.get(assigns, :height, @dimensions[:height])
    }
  end

  def settings(assigns \\ %{}) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" {args(assigns)} xml:space="preserve" style="shape-rendering:geometricPrecision;text-rendering:geometricPrecision;image-rendering:optimizeQuality;fill-rule:evenodd;clip-rule:evenodd" viewBox="0 0 6.827 6.827">
      <defs>
        <style>
          .fil2 {
            fill: none
          }
        </style>
      </defs>
      <g id="Layer_x0020_1">
        <path d="M3.413 1.327c-.126 0-.254.011-.381.035l-.121-.263a.328.328 0 0 0-.435-.16l-.334.152a.33.33 0 0 0-.16.436l.12.262c-.158.13-.295.279-.408.444l-.272-.1a.335.335 0 0 0-.421.193l-.127.344a.326.326 0 0 0-.02.11v.009a.329.329 0 0 0 .214.302l.272.1c-.022.2-.015.402.023.603l-.263.121a.329.329 0 0 0-.161.435l.154.333c.076.165.27.237.434.161l.264-.121c.129.16.278.296.442.409l-.1.272a.323.323 0 0 0 .01.25c.036.08.102.14.184.171l.345.127a.328.328 0 0 0 .42-.194l.1-.272c.074.008.148.012.221.012v-.789c-.504 0-.966-.296-1.177-.754a1.298 1.298 0 0 1 1.176-1.84h.001v-.788z" style="fill:#00c853;fill-rule:nonzero" />
        <path d="m5.76 3.734-.273-.1c.021-.2.014-.402-.023-.603l.263-.121a.328.328 0 0 0 .16-.435l-.153-.333a.327.327 0 0 0-.435-.161l-.263.121a2.07 2.07 0 0 0-.443-.409l.1-.272A.329.329 0 0 0 4.5 1L4.155.873a.336.336 0 0 0-.42.193l-.101.273a2.098 2.098 0 0 0-.217-.012h-.004v.789h.003c.503.001.964.297 1.175.754a1.298 1.298 0 0 1-1.177 1.839v.789a2.1 2.1 0 0 0 .381-.035l.121.263c.076.164.271.236.435.16l.333-.153a.328.328 0 0 0 .16-.435l-.12-.263c.159-.128.296-.278.409-.443l.272.101a.327.327 0 0 0 .42-.194l.128-.344a.328.328 0 0 0-.194-.421z" style="fill:#00e676;fill-rule:nonzero" />
        <g id="_490166928">
          <path id="_490167024" class="fil2" d="M0 0h6.827v6.827H0z" />
          <path id="_490167120" class="fil2" d="M.853.853h5.12v5.12H.853z" />
        </g>
      </g>
    </svg>
    """
  end

  def start(assigns \\ %{}) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" {args(assigns)} viewBox="0 0 350 350" xml:space="preserve">
      <path fill="#88E5D9" d="M276.646 95.979c-8.549 22.295-24.311 54.441-50.844 80.975-12.215 12.214-26.438 23.07-42.498 32.471a6.706 6.706 0 0 0-.83.488c-8.597 4.984-17.718 9.554-27.337 13.691l-28.74-28.742c4.139-9.62 8.708-18.742 13.693-27.341.182-.262.34-.536.482-.82 9.4-16.063 20.258-30.288 32.475-42.505 26.532-26.532 58.679-42.294 80.974-50.843 13.547-5.196 25.209-8.436 32.918-10.294-1.857 7.711-5.097 19.373-10.293 32.92z" />
      <path fill="#69CCBE" d="M262.732 70.178a274.459 274.459 0 0 1-8.459 25.801c-8.551 22.295-24.312 54.441-50.846 80.975-12.215 12.214-26.436 23.07-42.497 32.471a6.706 6.706 0 0 0-.83.488 247.507 247.507 0 0 1-12.097 6.557l7.134 7.135c9.619-4.138 18.74-8.707 27.337-13.691.264-.184.543-.345.83-.488 16.061-9.4 30.283-20.257 42.498-32.471 26.533-26.534 42.295-58.68 50.844-80.975 5.195-13.547 8.435-25.209 10.293-32.92-6 1.445-14.392 3.727-24.207 7.118z" />
      <path fill="#FF54A4" d="M222.519 116.948a10.464 10.464 0 0 0-7.447 3.085 10.462 10.462 0 0 0-3.086 7.447c0 2.814 1.096 5.459 3.086 7.447a10.462 10.462 0 0 0 7.447 3.087c2.814 0 5.457-1.097 7.447-3.087 4.107-4.106 4.107-10.788 0-14.895a10.46 10.46 0 0 0-7.447-3.084z" />
      <path fill="#041C3F" d="M239.543 110.457c-4.547-4.548-10.594-7.052-17.023-7.052s-12.477 2.504-17.023 7.052a23.917 23.917 0 0 0-7.051 17.023 23.92 23.92 0 0 0 7.051 17.024 23.918 23.918 0 0 0 17.021 7.051h.002c6.43 0 12.477-2.504 17.023-7.051a23.921 23.921 0 0 0 7.051-17.024c0-6.43-2.504-12.476-7.051-17.023zm-9.576 24.47a10.461 10.461 0 0 1-7.447 3.087 10.462 10.462 0 0 1-7.447-3.087 10.457 10.457 0 0 1-3.086-7.447c0-2.812 1.096-5.458 3.086-7.447 1.988-1.989 4.635-3.085 7.447-3.085s5.457 1.095 7.447 3.085c4.107 4.106 4.107 10.788 0 14.894zM54.28 256.221a6.77 6.77 0 0 1-4.787-11.558l39.152-39.153a6.77 6.77 0 0 1 9.576 0 6.773 6.773 0 0 1 0 9.577l-39.153 39.152a6.752 6.752 0 0 1-4.788 1.982zM63.035 293.737a6.769 6.769 0 0 1-4.788-11.558l40.81-40.81a6.769 6.769 0 0 1 9.575 0 6.77 6.77 0 0 1 0 9.576l-40.809 40.809a6.752 6.752 0 0 1-4.788 1.983zM100.551 302.491a6.77 6.77 0 0 1-4.788-11.558l39.153-39.154a6.772 6.772 0 0 1 9.575 9.577l-39.152 39.153a6.755 6.755 0 0 1-4.788 1.982z" />
      <path fill="#9788E2" d="m88.636 165.706 29.129-29.034 31.34-6.102c-6.797 8.361-13.102 17.385-18.891 27.041l-41.578 8.095z" />
      <path fill="#7C71CC" d="m117.765 145.965 23.027-4.482a224.366 224.366 0 0 1 8.312-10.912l-31.34 6.102-29.129 29.034 11.587-2.255 17.543-17.487z" />
      <path fill="#9788E2" d="m184.293 261.365 8.094-41.578c9.658-5.788 18.68-12.093 27.041-18.891l-6.102 31.34-29.033 29.129z" />
      <path fill="#041C3F" d="M300.508 49.493a6.771 6.771 0 0 0-5.863-1.898c-.787.128-19.555 3.21-45.129 12.981-15.004 5.731-29.258 12.596-42.369 20.402-16.1 9.585-30.512 20.633-42.859 32.84l-51.136 9.955a6.776 6.776 0 0 0-3.486 1.851l-46.328 46.18a6.77 6.77 0 0 0 6.075 11.443l52.255-10.174a282.282 282.282 0 0 0-9.538 20.784 6.775 6.775 0 0 0 1.475 7.364l12.801 12.801-11.893 11.893a6.769 6.769 0 0 0 4.789 11.558 6.753 6.753 0 0 0 4.787-1.982l11.893-11.894 12.801 12.802a6.776 6.776 0 0 0 7.363 1.473 281.652 281.652 0 0 0 20.782-9.536l-10.171 52.255a6.77 6.77 0 0 0 11.441 6.073l46.18-46.328a6.781 6.781 0 0 0 1.852-3.486l9.953-51.136c12.207-12.349 23.256-26.759 32.842-42.86 7.805-13.112 14.67-27.366 20.402-42.369 9.77-25.576 12.853-44.342 12.98-45.129a6.784 6.784 0 0 0-1.899-5.863zM88.636 165.706l29.129-29.034 31.34-6.102c-6.797 8.361-13.102 17.385-18.891 27.041l-41.578 8.095zm124.69 66.53-29.033 29.129 8.094-41.578c9.658-5.788 18.68-12.093 27.041-18.891l-6.102 31.34zm63.32-136.257c-8.549 22.295-24.311 54.441-50.844 80.975-12.215 12.214-26.438 23.07-42.498 32.471a6.706 6.706 0 0 0-.83.488c-8.597 4.984-17.718 9.554-27.337 13.691l-9.582-9.583 19.342-19.341a6.771 6.771 0 1 0-9.576-9.576l-19.342 19.341-9.582-9.583c4.139-9.62 8.708-18.742 13.693-27.341.182-.262.34-.536.482-.82 9.4-16.063 20.258-30.288 32.475-42.505 26.532-26.532 58.679-42.294 80.974-50.843 13.547-5.196 25.209-8.436 32.918-10.294-1.857 7.711-5.097 19.373-10.293 32.92z" />
      <path fill="#7C71CC" d="m210.672 207.648-4.787 24.588-19.785 19.851-1.807 9.278 29.033-29.129 6.102-31.34a221.647 221.647 0 0 1-8.756 6.752z" />
    </svg>
    """
  end

  def about(assigns \\ %{}) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" {args(assigns)} viewBox="0 0 512 512" style="enable-background:new 0 0 512 512" xml:space="preserve">
      <style>
        .st1,
        .st8 {
          fill: none;
          stroke: #000;
          stroke-width: 20;
          stroke-linecap: round;
          stroke-linejoin: round;
          stroke-miterlimit: 10
        }

        .st8 {
          fill: #fff
        }
      </style>
      <g id="ICON_1_">
        <path d="M96.3 339.5 25.8 410c-21 21-21 55.1 0 76.2h0c21 21 55.1 21 76.2 0l70.5-70.5c-15-9.5-29.2-20.9-42.2-33.9s-24.5-27.3-34-42.3z" style="fill:#de5a5a;stroke:#000;stroke-width:20;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:10" />
        <circle cx="305.9" cy="206.1" r="196.1" style="fill:#7585f0" />
        <path class="st8" d="M167.3 344.7c-13.2-13.2-24.1-27.8-32.8-43.4l-38.2 38.2c9.5 15 20.9 29.2 33.9 42.2 13.1 13.1 27.3 24.4 42.2 33.9l38.2-38.2c-15.5-8.6-30.1-19.5-43.3-32.7z" />
        <path class="st1" d="M250.1 394.1c-30.3-9-58.9-25.4-82.8-49.4-76.6-76.6-76.6-200.7 0-277.3s200.7-76.6 277.3 0 76.6 200.7 0 277.3c-28.7 28.7-64.2 46.7-101.3 53.9" />
        <circle transform="rotate(-85.797 305.932 206.068) scale(.99999)" class="st8" cx="305.9" cy="206.1" r="145.1" />
        <path d="M244.5 144.6C294 95.1 370.7 88.9 427 126.1c-5.3-8-11.5-15.6-18.5-22.6-56.6-56.6-148.6-56.6-205.1 0s-56.6 148.6 0 205.1c7 7 14.6 13.2 22.6 18.5-37.2-56.3-31-133 18.5-182.5z" style="fill:#d4f4ff" />
        <path class="st1" d="M206.2 212.5c6.1-24.9 18.8-48.5 38.2-67.9C294 95.1 370.7 88.9 427 126.1c-5.3-8-11.5-15.6-18.5-22.6-56.6-56.6-148.6-56.6-205.1 0s-56.6 148.6 0 205.1c7 7 14.6 13.2 22.6 18.5" />
      </g>
    </svg>
    """
  end

  def infer_schema(assigns \\ %{}) do
    ~H"""
      <svg xmlns="http://www.w3.org/2000/svg" {args(assigns)} viewBox="0 0 48 48">
        <defs>
          <style>
            .cls-2 {
              fill: #42a5f5
            }
          </style>
        </defs>
        <g id="Scaning">
          <path d="m46.83 41.17-6.36-6.36L37.64 32a1 1 0 0 0-1.42 0l-3.57-3.56a18.06 18.06 0 1 0-4.23 4.23L32 36.22a1 1 0 0 0 0 1.42l2.83 2.82 6.36 6.36a4 4 0 0 0 5.66-5.66zM2 18a16 16 0 1 1 16 16A16 16 0 0 1 2 18zm29.39 12 3.42 3.41-1.42 1.39L30 31.39A15.64 15.64 0 0 0 31.39 30zm5.54 4.12 1.41 1.41-2.82 2.83-1.42-1.43zm8.48 11.31a2 2 0 0 1-2.82 0l-5.66-5.65 2.83-2.83 5.65 5.66a2 2 0 0 1 0 2.82z" style="fill:#424242" />
          <ellipse class="cls-2" cx="18" cy="14" rx="3.98" ry="1" />
          <path class="cls-2" d="M18 19c2.47 0 3.85-.75 4-1.05v-1.64a11 11 0 0 1-4 .69 11 11 0 0 1-4-.69V18c.18.27 1.56 1 4 1z" />
          <path class="cls-2" d="M18 5a13 13 0 1 0 13 13A13 13 0 0 0 18 5zm6 17c0 2.06-3.11 3-6 3s-6-.94-6-3v-8c0-2.06 3.11-3 6-3s6 .94 6 3z" />
          <path class="cls-2" d="M18 21a10.83 10.83 0 0 1-4-.69V22c.13.25 1.51 1 4 1s3.87-.75 4-1.05V20.3a10.83 10.83 0 0 1-4 .7z" />
        </g>
      </svg>
    """
  end

  def insert_schema(assigns \\ %{}) do
    ~H"""
      <svg xmlns="http://www.w3.org/2000/svg" {args(assigns)}  viewBox="0 0 48 48">
        <defs>
          <style>
            .cls-1 {
              fill: #42a5f5
            }
          </style>
        </defs>
        <g id="Databse_Update" data-name="Databse Update">
          <ellipse class="cls-1" cx="24" cy="6" rx="24" ry="6" />
          <path d="M48 9.43V36c0 2.91-6 4.4-11 5.13a12.69 12.69 0 0 0 .67-2.13c6.27-1 8.33-2.5 8.33-3v-7.39c-2.14 1.25-5.66 2-8.88 2.51a13 13 0 0 0-.87-1.9C43.62 28.2 46 26.55 46 26v-7.37C41.51 21.23 30.49 22 24 22s-17.51-.77-22-3.37V26c0 .55 2.38 2.2 9.75 3.22a13 13 0 0 0-.87 1.9c-3.22-.48-6.74-1.26-8.88-2.51V36c0 .27 1 1.48 6 2.56.75.17 1.54.31 2.37.45a14.65 14.65 0 0 0 .63 2.13 54.04 54.04 0 0 1-3.45-.62C2.46 39.41 0 37.93 0 36V9.43a10.9 10.9 0 0 0 2 1.19V16c0 1.36 7.77 4 22 4s22-2.64 22-4v-5.38a10.9 10.9 0 0 0 2-1.19z" style="fill:#424242" />
          <path class="cls-1" d="M24 24a12 12 0 1 0 12 12 12 12 0 0 0-12-12zm4.88 19.54a1 1 0 0 1-1 .88h-.11a1 1 0 0 1-.88-1.11l.11-1a7 7 0 0 1-10-5.92 1 1 0 1 1 2-.11 5 5 0 0 0 7 4.26l-1.16-.4a1 1 0 1 1 .65-1.89l3 1a.6.6 0 0 1 .11.06.77.77 0 0 1 .21.14l.05.07a1.27 1.27 0 0 1 .13.19 1.12 1.12 0 0 1 .05.13.54.54 0 0 1 0 .22.33.33 0 0 1 0 .14v.06zm1.17-6.87H30a1 1 0 0 1-1-1 5 5 0 0 0-7-4.26l1.16.4a1 1 0 0 1-.33 1.94 1.25 1.25 0 0 1-.32 0l-3-1-.11-.06a.77.77 0 0 1-.21-.14l-.19-.16a1.27 1.27 0 0 1-.13-.19 1.12 1.12 0 0 1-.05-.13.54.54 0 0 1 0-.22.33.33 0 0 1 0-.14v-.06l.36-3.19a1 1 0 0 1 1.1-.88 1 1 0 0 1 .88 1.11l-.11 1a7 7 0 0 1 10 5.92 1 1 0 0 1-1 1.06z" />
        </g>
      </svg>
    """
  end

  def insert_data(assigns \\ %{}) do
    ~H"""
      <svg xmlns="http://www.w3.org/2000/svg" {args(assigns)} viewBox="0 0 48 48">
        <defs>
          <style>
            .cls-1 {
              fill: #42a5f5
            }
          </style>
        </defs>
        <g id="Database_add" data-name="Database add">
          <ellipse class="cls-1" cx="24" cy="6" rx="24" ry="6" />
          <path d="M48 9.43V36c0 2.91-6 4.4-11 5.13a12.69 12.69 0 0 0 .67-2.13c6.27-1 8.33-2.5 8.33-3v-7.39c-2.14 1.25-5.66 2-8.88 2.51a13 13 0 0 0-.87-1.9C43.62 28.2 46 26.55 46 26v-7.37C41.51 21.23 30.49 22 24 22s-17.51-.77-22-3.37V26c0 .55 2.38 2.2 9.75 3.22a13 13 0 0 0-.87 1.9c-3.22-.48-6.74-1.26-8.88-2.51V36c0 .27 1 1.48 6 2.56.75.17 1.54.31 2.37.45a14.65 14.65 0 0 0 .63 2.13 54.04 54.04 0 0 1-3.45-.62C2.46 39.41 0 37.93 0 36V9.43a10.9 10.9 0 0 0 2 1.19V16c0 1.36 7.77 4 22 4s22-2.64 22-4v-5.38a10.9 10.9 0 0 0 2-1.19z" style="fill:#424242" />
          <path class="cls-1" d="M24 24a12 12 0 1 0 12 12 12 12 0 0 0-12-12zm7 13h-6v6a1 1 0 0 1-2 0v-6h-6a1 1 0 0 1 0-2h6v-6a1 1 0 0 1 2 0v6h6a1 1 0 0 1 0 2z" />
        </g>
      </svg>
    """
  end

  def db_settings(assigns \\ %{}) do
    ~H"""
      <svg xmlns="http://www.w3.org/2000/svg" {args(assigns)} {%{class: assigns[:class]}} viewBox="0 0 32 32">
        <defs>
          <style>
            .cls-1 {
              fill: #ffe082
            }
          </style>
        </defs>
        <g id="database_setting" data-name="database setting">
          <path class="cls-1" d="M27.31 13a1 1 0 0 0-1 1c0 1.39-4 3.4-10.31 3.4S5.69 15.39 5.69 14a1 1 0 0 0-2 0v6.6C3.69 24.11 10 26 16 26s12.31-1.89 12.31-5.4V14a1 1 0 0 0-1-1z" />
          <path d="M27.31 6.4a1 1 0 0 0-1 1c0 1.39-4 3.4-10.31 3.4S5.69 8.79 5.69 7.4a1 1 0 0 0-2 0V14c0 3.51 6.34 5.4 12.31 5.4s12.31-1.89 12.31-5.4V7.4a1 1 0 0 0-1-1z" style="fill:#ffb74d" />
          <path d="M30 24a7.33 7.33 0 0 0-1.13 0 3.91 3.91 0 0 0-.45-1 11 11 0 0 0 .82-.79 1 1 0 0 0-1.41-1.41 9.87 9.87 0 0 0-.79.82 3.91 3.91 0 0 0-1.04-.49A9.32 9.32 0 0 0 26 20a1 1 0 0 0-2 0 7.38 7.38 0 0 0 0 1.13 3.91 3.91 0 0 0-1.07.45c-.22-.28-.42-.43-.79-.82a1 1 0 0 0-1.41 1.41 9.37 9.37 0 0 0 .82.79 3.91 3.91 0 0 0-.42 1.04A9.32 9.32 0 0 0 20 24a1 1 0 0 0 0 2 7.38 7.38 0 0 0 1.13 0 3.91 3.91 0 0 0 .45 1 11 11 0 0 0-.82.79 1 1 0 0 0 1.41 1.41 9.87 9.87 0 0 0 .79-.82 3.91 3.91 0 0 0 1.07.45A9.32 9.32 0 0 0 24 30a1 1 0 0 0 2 0 7.38 7.38 0 0 0 0-1.13 3.91 3.91 0 0 0 1-.45c.22.28.42.43.79.82a1 1 0 0 0 1.41-1.41 9.37 9.37 0 0 0-.82-.79 3.91 3.91 0 0 0 .49-1.04A9.32 9.32 0 0 0 30 26a1 1 0 0 0 0-2zm-5 3a2 2 0 1 1 2-2 2 2 0 0 1-2 2z" style="fill:#039be5" />
          <path class="cls-1" d="M16 2C10 2 3.69 3.89 3.69 7.4S10 12.8 16 12.8s12.31-1.89 12.31-5.4S22 2 16 2z" />
        </g>
      </svg>
    """
  end

  def bulb(assigns \\ %{}) do
    ~H"""
      <svg xmlns="http://www.w3.org/2000/svg" {args(assigns)} viewBox="0 0 128 128" style="enable-background:new 0 0 128 128" xml:space="preserve">
        <path style="fill:#51514c" d="M77.547 120.684h-5.765l-1.698 3.012a7.477 7.477 0 0 1-6.513 3.804h-.003a7.479 7.479 0 0 1-6.513-3.804l-1.698-3.012h-5.765v-4.06h27.956v4.06z" />
        <path style="fill:#a7a79b" d="M77.547 113.65H49.591v-4.279h27.956v4.279zm0-11.711H49.591v4.279h27.956v-4.279zm38.587-32.576-12.209-3.271.92-3.434 12.209 3.271-.92 3.434zm-104.268 0-.92-3.434 12.209-3.271.92 3.434-12.209 3.271zm92.979-24.913-.92-3.434 12.209-3.272.92 3.434-12.209 3.272zm-81.69 0-12.209-3.272.92-3.434 12.209 3.272-.92 3.434zM94.82 25.247l-2.514-2.514 8.938-8.938 2.514 2.514-8.938 8.938zm-61.64 0-8.937-8.938 2.514-2.514 8.937 8.938-2.514 2.514zm43.358-11.618-3.434-.92L76.376.5l3.434.92-3.272 12.209zm-25.076 0L48.191 1.42 51.625.5l3.272 12.209-3.435.92z" />
        <path style="fill:#f4d100" d="M59.802 64.141h7.535v34.934h-7.535V64.141zm3.767-44.754c-18.485-.53-33.631 14.817-33.631 33.824 0 9.781 4.016 18.581 10.431 24.753 5.637 5.423 9.222 13.147 9.222 21.111h7.84V64.141H51.75c-4.44 0-8.051-3.612-8.051-8.051s3.612-8.051 8.051-8.051 8.052 3.612 8.052 8.051v5.681h7.535V56.09c0-4.44 3.612-8.051 8.052-8.051 4.44 0 8.051 3.612 8.051 8.051s-3.612 8.051-8.051 8.051h-5.682v34.934h7.84c0-7.964 3.584-15.688 9.222-21.111C93.184 71.792 97.2 62.992 97.2 53.211c0-19.008-15.146-34.355-33.631-33.824zM51.75 50.408a5.687 5.687 0 0 0-5.681 5.681 5.687 5.687 0 0 0 5.681 5.681h5.682v-5.681a5.688 5.688 0 0 0-5.682-5.681zM75.389 61.77h-5.682v-5.681a5.688 5.688 0 0 1 5.682-5.681 5.687 5.687 0 0 1 5.681 5.681 5.687 5.687 0 0 1-5.681 5.681z" />
      </svg>
    """
  end

  def right_arrow(assigns \\ %{}) do
    ~H"""
      <svg xmlns="http://www.w3.org/2000/svg" {args(assigns)} viewBox="0 0 24 24">
        <path d="m21.707 11.293-7-7A1 1 0 0 0 13 5v3H3a1 1 0 0 0-1 1v6a1 1 0 0 0 1 1h10v3a1 1 0 0 0 1.707.707l7-7a1 1 0 0 0 0-1.414z" style="fill:#ff8e31" data-name="Right" />
      </svg>
    """
  end

  def mysql_icon(assigns \\ %{}) do
    ~H"""
      <svg xmlns="http://www.w3.org/2000/svg" {args(assigns)} viewBox="-18.458 6.58 191.151 132.49">
        <path d="M-18.458 6.58h191.151v132.49H-18.458V6.58z" fill="none" />
        <path d="M40.054 113.583h-5.175c-.183-8.735-.687-16.947-1.511-24.642h-.046l-7.879 24.642h-3.94l-7.832-24.642h-.045c-.581 7.388-.947 15.602-1.099 24.642H7.81c.304-10.993 1.068-21.299 2.289-30.919h6.414l7.465 22.719h.046l7.511-22.719h6.137c1.344 11.268 2.138 21.575 2.382 30.919M62.497 90.771c-2.107 11.434-4.887 19.742-8.337 24.928-2.688 3.992-5.633 5.99-8.84 5.99-.855 0-1.91-.258-3.16-.77v-2.757c.611.088 1.328.138 2.152.138 1.498 0 2.702-.412 3.62-1.238 1.098-1.006 1.647-2.137 1.647-3.388 0-.858-.428-2.612-1.282-5.268L42.618 90.77h5.084l4.076 13.19c.916 2.995 1.298 5.086 1.145 6.277 2.229-5.953 3.786-12.444 4.673-19.468h4.901v.002z" fill="#5d87a1" />
        <path d="M131.382 113.583h-14.7V82.664h4.945v27.113h9.755v3.806zM112.834 114.33l-5.684-2.805c.504-.414.986-.862 1.42-1.381 2.416-2.838 3.621-7.035 3.621-12.594 0-10.229-4.014-15.346-12.045-15.346-3.938 0-7.01 1.298-9.207 3.895-2.414 2.84-3.619 7.022-3.619 12.551 0 5.435 1.068 9.422 3.205 11.951 1.955 2.291 4.902 3.438 8.843 3.438 1.47 0 2.819-.18 4.048-.543l7.4 4.308 2.018-3.474zm-18.413-6.934c-1.252-2.014-1.878-5.248-1.878-9.707 0-7.785 2.365-11.682 7.1-11.682 2.475 0 4.289.932 5.449 2.792 1.25 2.017 1.879 5.222 1.879 9.619 0 7.849-2.367 11.774-7.099 11.774-2.476.001-4.29-.928-5.451-2.796M85.165 105.013c0 2.622-.962 4.773-2.884 6.458-1.924 1.678-4.504 2.519-7.737 2.519-3.024 0-5.956-.966-8.794-2.888l1.329-2.655c2.442 1.223 4.653 1.831 6.638 1.831 1.863 0 3.319-.413 4.375-1.232 1.055-.822 1.684-1.975 1.684-3.433 0-1.837-1.281-3.407-3.631-4.722-2.167-1.19-6.501-3.678-6.501-3.678-2.349-1.712-3.525-3.55-3.525-6.578 0-2.506.877-4.529 2.632-6.068 1.757-1.545 4.024-2.315 6.803-2.315 2.87 0 5.479.769 7.829 2.291l-1.192 2.656c-2.01-.854-3.994-1.281-5.951-1.281-1.585 0-2.809.381-3.66 1.146-.858.762-1.387 1.737-1.387 2.933 0 1.828 1.308 3.418 3.722 4.759 2.196 1.192 6.638 3.723 6.638 3.723 2.409 1.709 3.612 3.53 3.612 6.534" fill="#f8981d" />
        <path d="M137.59 72.308c-2.99-.076-5.305.225-7.248 1.047-.561.224-1.453.224-1.531.933.303.3.338.784.601 1.198.448.747 1.229 1.752 1.942 2.276.783.6 1.569 1.194 2.393 1.717 1.453.899 3.1 1.422 4.516 2.318.825.521 1.645 1.195 2.471 1.756.406.299.666.784 1.193.971v-.114c-.264-.336-.339-.822-.598-1.196l-1.122-1.082c-1.084-1.456-2.431-2.727-3.884-3.771-1.196-.824-3.812-1.944-4.297-3.322l-.076-.076c.822-.077 1.797-.375 2.578-.604 1.271-.335 2.43-.259 3.734-.594.6-.15 1.195-.338 1.797-.523v-.337c-.676-.673-1.158-1.567-1.869-2.203-1.902-1.643-3.998-3.25-6.164-4.595-1.16-.749-2.652-1.231-3.887-1.868-.445-.225-1.195-.336-1.457-.71-.67-.822-1.047-1.904-1.533-2.877-1.08-2.053-2.129-4.331-3.061-6.502-.674-1.456-1.084-2.91-1.906-4.257-3.85-6.35-8.031-10.196-14.457-13.971-1.381-.786-3.024-1.121-4.779-1.533l-2.803-.148c-.598-.262-1.197-.973-1.719-1.309-2.132-1.344-7.621-4.257-9.189-.411-1.01 2.431 1.494 4.821 2.354 6.054.635.856 1.458 1.83 1.902 2.802.263.635.337 1.309.6 1.98.598 1.644 1.157 3.473 1.943 5.007.41.782.857 1.604 1.381 2.312.3.414.822.597.936 1.272-.521.744-.562 1.867-.861 2.801-1.344 4.221-.819 9.45 1.086 12.552.596.934 2.018 2.99 3.92 2.202 1.684-.672 1.311-2.801 1.795-4.668.111-.451.038-.747.262-1.043v.073c.521 1.045 1.047 2.052 1.53 3.1 1.159 1.829 3.177 3.735 4.858 5.002.895.676 1.604 1.832 2.725 2.245V74.1h-.074c-.227-.335-.559-.485-.857-.745-.674-.673-1.42-1.495-1.943-2.241-1.566-2.093-2.952-4.41-4.182-6.801-.602-1.16-1.121-2.428-1.606-3.586-.226-.447-.226-1.121-.601-1.346-.562.821-1.381 1.532-1.791 2.538-.711 1.609-.785 3.588-1.049 5.646l-.147.072c-1.19-.299-1.604-1.53-2.056-2.575-1.119-2.654-1.307-6.914-.336-9.976.26-.783 1.385-3.249.936-3.995-.225-.715-.973-1.122-1.383-1.685-.482-.708-1.01-1.604-1.346-2.39-.896-2.091-1.347-4.408-2.312-6.498-.451-.974-1.234-1.982-1.868-2.879-.712-1.008-1.495-1.718-2.058-2.913-.186-.411-.447-1.083-.148-1.53.073-.3.225-.412.523-.487.484-.409 1.867.111 2.352.336 1.385.56 2.543 1.083 3.699 1.867.523.375 1.084 1.085 1.755 1.272h.786c1.193.26 2.538.072 3.661.41 1.979.636 3.772 1.569 5.38 2.576 4.893 3.103 8.928 7.512 11.652 12.778.447.858.637 1.644 1.045 2.539.787 1.832 1.76 3.7 2.541 5.493.785 1.755 1.533 3.547 2.654 5.005.559.784 2.805 1.195 3.812 1.606.745.335 1.905.633 2.577 1.044 1.271.783 2.537 1.682 3.732 2.543.595.448 2.465 1.382 2.576 2.13M99.484 39.844a5.82 5.82 0 0 0-1.529.188v.075h.072c.301.597.824 1.011 1.197 1.532.301.599.562 1.193.857 1.791l.072-.074c.527-.373.789-.971.789-1.868-.227-.264-.262-.522-.451-.784-.22-.374-.705-.56-1.007-.86" fill="#5d87a1" />
        <path d="M141.148 113.578h.774v-3.788h-1.161l-.947 2.585-1.029-2.585h-1.118v3.788h.731v-2.882h.041l1.078 2.882h.557l1.074-2.882v2.882zm-6.235 0h.819v-3.146h1.072v-.643h-3.008v.643h1.115l.002 3.146z" fill="#f8981d" />
      </svg>
    """
  end

  def postgresql_icon(assigns \\ %{}) do
    ~H"""
      <svg xmlns="http://www.w3.org/2000/svg" {args(assigns)}>
        <style>
          <![CDATA[
          .B {
            stroke-width: 1.369
          }

          .C {
            stroke: #fff
          }

          .D {
            stroke-linecap: round
          }

          .E {
            stroke-linejoin: round
          }
          ]]>
        </style>
        <path d="M86.088 30.193H74.484v-11.67h12.234c4.478 0 6.717 1.975 6.717 5.926 0 3.83-2.45 5.746-7.347 5.746m8.34-11.808c-1.6-1.424-3.815-2.136-6.674-2.136l-16.618.092v27.92h3.348l-.03-11.886H86.82c3.1 0 5.542-.712 7.323-2.136s2.672-3.4 2.672-5.927-.795-4.502-2.385-5.927zM116.1 38.4a5.72 5.72 0 0 1-1.589 2.375c-1.5 1.464-3.788 2.195-6.866 2.195-2.78 0-4.912-.7-6.4-2.134s-2.233-3.327-2.233-5.713c0-1.242.195-2.345.584-3.307s.954-1.774 1.694-2.436c1.54-1.403 3.658-2.105 6.356-2.105 5.976 0 8.965 2.616 8.965 7.848 0 1.243-.17 2.335-.5 3.277m.607-10.3c-2.04-1.86-5.06-2.8-9.062-2.8-3.78 0-6.702.95-8.762 2.85-1.86 1.72-2.8 4.04-2.8 6.962 0 2.9.96 5.24 2.88 7.02 1.06.96 2.295 1.656 3.706 2.086s3.066.645 4.966.645c3.98 0 7-.92 9.092-2.76 1.86-1.68 2.8-4 2.8-6.992 0-3-.94-5.34-2.82-7.022zm25.318 11.107c0 3.758-3.367 5.637-10.1 5.637-2.058 0-3.792-.13-5.2-.392s-2.553-.695-3.432-1.298a5.02 5.02 0 0 1-1.619-1.8c-.4-.74-.66-1.67-.78-2.8l3.133-.03c0 1.48.548 2.568 1.645 3.268 1.177.84 3.26 1.26 6.253 1.26 4.706 0 7.06-1.18 7.06-3.538 0-1.38-.8-2.328-2.368-2.85-.32-.1-2.223-.365-5.7-.794s-5.66-.815-6.518-1.155c-1.858-.74-2.787-2.07-2.787-3.988 0-1.88.83-3.28 2.5-4.198.82-.38 1.845-.674 3.076-.885s2.656-.315 4.276-.315c6.482 0 9.723 2.034 9.723 6.1h-2.98c0-2.86-2.28-4.3-6.835-4.3-2.318 0-4.047.3-5.186.87s-1.708 1.47-1.708 2.67c0 1.12.77 1.93 2.308 2.43.9.26 2.968.56 6.206.9 2.898.26 4.887.63 5.966 1.1 2.06.8 3.088 2.16 3.088 4.077zm12.306 5.093l-1.275.18-.795.06c-2.04 0-3.5-.295-4.413-.887s-1.353-1.627-1.353-3.1V27.798H142.8v-1.874h3.687l.03-6.02h2.856v6.02h4.974v1.904l-4.974-.03v12.397c0 .923.245 1.56.735 1.9s1.364.526 2.624.526c.18.02.38.014.6-.02a10.55 10.55 0 0 0 .99-.226l.03 1.9zm19.755-4.23c-.78.64-1.668 1.128-2.667 1.47s-2.148.5-3.446.5c-5.974 0-8.96-2.467-8.96-7.4 0-2.297.764-4.095 2.293-5.394s3.68-1.948 6.458-1.948c2.797 0 4.92.655 6.368 1.963s2.173 3.062 2.173 5.26c0 2.397-.74 4.245-2.218 5.543m5.075-14.135h-2.856l-.03 3.15c-1.26-1.28-2.16-2.087-2.7-2.427-1.6-.88-3.668-1.318-6.207-1.318-3.718 0-6.558.85-8.516 2.548-1.86 1.56-2.788 3.817-2.788 6.774 0 1.46.235 2.762.705 3.9s1.156 2.123 2.057 2.922c1.962 1.638 4.735 2.458 8.32 2.458 4.304 0 7.357-1.177 9.16-3.532v3.26c0 2.08-.655 3.688-1.964 4.828s-3.463 1.7-6.462 1.7c-2.82 0-4.828-.4-6.027-1.164-.9-.597-1.52-1.632-1.86-3.105h-2.94c.32 2.057 1.2 3.545 2.6 4.463 1.64 1.058 4.4 1.587 8.3 1.587 7.46 0 11.2-2.773 11.2-8.32V25.937zm15.45 1.853c-.86-.14-1.658-.2-2.396-.2-4.695 0-7.042 2.575-7.042 7.723v8.954h-2.826l-.03-18.322 2.857.028v3.27h.15c.48-1.288 1.24-2.265 2.278-2.93 1.138-.644 2.836-.966 5.094-.966h1.917v2.46zm2.657 6.158c.36-2.082 1.17-3.694 2.427-4.836.82-.66 1.75-1.157 2.788-1.487s2.2-.496 3.508-.496c2.538 0 4.6.696 6.22 2.088s2.412 2.97 2.412 4.73H197.28m17.633-5.652c-1-1.003-2.24-1.744-3.72-2.226s-3.2-.722-5.2-.722c-3.7 0-6.57.86-8.612 2.58s-3.06 4.06-3.06 7.022.98 5.3 2.94 7.05c2.12 1.92 5.1 2.88 8.968 2.88 1.54 0 2.963-.175 4.273-.523s2.455-.842 3.434-1.48c1.72-1.235 2.808-2.76 3.27-4.57h-3.088c-1.06 3.133-3.697 4.7-7.914 4.7-2.978 0-5.267-.766-6.865-2.298-1.38-1.313-2.068-3.014-2.068-5.104h20.363c0-3.108-.9-5.545-2.73-7.3z" fill="#231f20" />
        <path d="M247.82 36.776c0 5.44-4.387 8.16-13.162 8.16-5.257 0-9.095-.937-11.513-2.8-1.98-1.54-2.968-3.888-2.968-7.048h3.532c0 5.078 3.65 7.617 10.948 7.617 3.5 0 6.03-.52 7.6-1.558 1.32-.918 1.98-2.357 1.98-4.314 0-1.938-.9-3.296-2.7-4.076-1.02-.42-3.5-.95-7.47-1.588-4.98-.76-8.208-1.518-9.688-2.277-2.14-1.12-3.2-3.017-3.2-5.694 0-2.497.9-4.355 2.73-5.574 1.96-1.338 5.32-2.008 10.078-2.008 8.6 0 12.9 2.856 12.9 8.568h-3.563c0-4.28-3.193-6.418-9.578-6.418-3.203 0-5.545.43-7.026 1.3-1.402.92-2.1 2.27-2.1 4.05 0 1.86.9 3.17 2.7 3.93.96.44 3.78 1.05 8.46 1.83 4.4.66 7.37 1.43 8.9 2.3 2.1 1.08 3.15 2.95 3.15 5.6zm28.7 2.776c-1.32 1.057-2.812 1.85-4.473 2.38s-3.523.793-5.584.793c-4.204 0-7.6-1.133-10.194-3.398s-3.887-5.284-3.887-9.057c0-3.932 1.285-6.996 3.857-9.192s5.98-3.293 10.223-3.293c4.303 0 7.686 1.148 10.148 3.443 1.3 1.12 2.26 2.426 2.882 3.923s.93 3.204.93 5.12c0 3.912-1.302 7.006-3.904 9.28m1.878 1.852c1.84-1.298 3.202-2.87 4.083-4.718s1.322-3.98 1.322-6.398c0-4.335-1.44-7.8-4.32-10.428-1.54-1.438-3.4-2.507-5.58-3.206s-4.67-1.05-7.47-1.05c-5.44 0-9.7 1.32-12.8 3.955s-4.65 6.212-4.65 10.727c0 4.394 1.564 7.94 4.693 10.636s7.403 4.045 12.82 4.045c2.12 0 3.968-.143 5.547-.43s2.92-.727 4.02-1.32l5.218 3.617 2.18-2.002-5.053-3.427zm31.85 2.857H286.1V16.3l3.318-.06v25.677h20.848l-.03 2.334z" fill="#367faf" />
        <path d="M48.237 39.567c.336-2.37.235-2.718 2.318-2.334l.53.04c1.602.062 3.697-.218 4.928-.703 2.65-1.042 4.22-2.782 1.608-2.325-5.96 1.042-6.37-.67-6.37-.67 6.293-7.915 8.924-17.963 6.654-20.423C51.7 6.445 40.99 9.617 40.8 9.7l-.057.01c-1.178-.207-2.496-.33-3.976-.35-2.697-.038-4.743.6-6.296 1.597 0 0-19.126-6.68-18.236 8.4.19 3.208 5.425 24.273 11.668 17.91 2.282-2.327 4.488-4.294 4.488-4.294a6.6 6.6 0 0 0 3.781.818l.106-.077c-.033.29-.02.57.043.906-1.608 1.523-1.136 1.79-4.352 2.352-3.253.568-1.342 1.58-.094 1.845 1.513.32 5.013.775 7.378-2.03l-.094.32c.63.428.588 3.075.678 4.967s.24 3.657.694 4.698.992 3.72 5.218 2.954c3.532-.642 6.233-1.565 6.48-10.155" fill="#231f20" stroke="#231f20" stroke-width="4.108" />
        <path d="M57.62 34.244c-5.96 1.042-6.37-.67-6.37-.67 6.293-7.916 8.924-17.964 6.654-20.423C51.71 6.444 40.99 9.617 40.8 9.7l-.058.01c-1.178-.207-2.496-.33-3.977-.35-2.697-.037-4.743.6-6.295 1.597 0 0-19.127-6.68-18.237 8.4.19 3.208 5.424 24.274 11.668 17.91 2.282-2.327 4.487-4.294 4.487-4.294a6.6 6.6 0 0 0 3.781.818l.107-.077c-.033.29-.018.57.043.906-1.608 1.523-1.136 1.79-4.35 2.352-3.254.568-1.342 1.58-.094 1.845 1.513.32 5.013.775 7.378-2.03l-.094.32c.63.428 1.073 2.783 1 4.92s-.124 3.6.373 4.746.992 3.72 5.22 2.954c3.532-.642 5.363-2.304 5.617-5.078.18-1.972.59-1.68.615-3.443l.328-.834c.378-2.673.06-3.535 2.236-3.134l.53.04c1.602.062 3.698-.218 4.928-.703 2.65-1.042 4.22-2.782 1.608-2.325z" fill="#417ba2" />
        <g fill="none" class="C B">
          <g class="D">
            <path d="M35.518 35.777c-.164 4.973.04 9.982.615 11.2s1.804 3.585 6.032 2.817c3.532-.642 4.817-1.884 5.374-4.626.4-2.017 1.203-7.62 1.304-8.767M30.45 10.843S11.3 4.213 12.2 19.3c.2 3.208 5.424 24.274 11.67 17.9 2.282-2.327 4.345-4.152 4.345-4.152M40.8 9.633c-.663.176 10.647-3.504 17.074 3.457 2.27 2.46-.36 12.508-6.654 20.424" class="E" />
            <path d="M51.21 33.513s.4 1.71 6.37.668c2.612-.457 1.04 1.283-1.61 2.326-2.174.855-7.048 1.074-7.127-.107-.205-3.05 2.565-2.123 2.365-2.887-.18-.688-1.42-1.363-2.24-3.047-.715-1.47-9.81-12.742 2.522-11.068.452-.08-3.217-9.944-14.76-10.104s-11.16 12.03-11.16 12.03" stroke-linejoin="bevel" />
          </g>
          <g class="E">
            <path d="M32.288 34.556c-1.61 1.523-1.136 1.79-4.352 2.352-3.254.57-1.342 1.58-.094 1.845 1.513.32 5.013.775 7.378-2.032.72-.855-.004-2.22-.993-2.566-.478-.168-1.117-.378-1.94.4z" />
            <path d="M32.183 34.53c-.162-.896.347-1.96.893-3.208.82-1.87 2.712-3.742 1.2-9.677-1.128-4.423-8.697-.92-8.7-.32s.342 3.04-.127 5.88c-.612 3.708 2.783 6.843 6.692 6.523" class="D" />
          </g>
        </g>
        <g fill="#fff" class="C">
          <path d="M30.382 21.233c-.034.205.443.75 1.064.824s1.15-.354 1.185-.558-.442-.43-1.064-.504-1.152.034-1.185.238z" stroke-width=".456" />
          <path d="M49.273 20.816c.034.205-.442.75-1.064.824s-1.152-.354-1.186-.56.443-.43 1.064-.504 1.15.033 1.185.238z" stroke-width=".228" />
        </g>
        <path d="M51.493 19.398c.102 1.607-.408 2.7-.473 4.412-.095 2.486 1.398 5.33-.852 8.18" fill="none" class="B C D E" />
      </svg>
    """
  end
end
