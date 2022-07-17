defmodule DashboardWeb.Live.IconSvg do
  import Phoenix.LiveView.Helpers
  # https://www.reshot.com/free-svg-icons/

  @dimensions %{width: 33, height: 33}

  def dimensions(assigns), do: Map.get(assigns, :dimensions, @dimensions)

  def settings(assigns \\ %{}) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" {dimensions(assigns)} xml:space="preserve" style="shape-rendering:geometricPrecision;text-rendering:geometricPrecision;image-rendering:optimizeQuality;fill-rule:evenodd;clip-rule:evenodd" viewBox="0 0 6.827 6.827">
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
    <svg xmlns="http://www.w3.org/2000/svg" {dimensions(assigns)} viewBox="0 0 350 350" xml:space="preserve">
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
    <svg xmlns="http://www.w3.org/2000/svg" {dimensions(assigns)} viewBox="0 0 512 512" style="enable-background:new 0 0 512 512" xml:space="preserve">
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
      <svg xmlns="http://www.w3.org/2000/svg" {dimensions(assigns)} viewBox="0 0 48 48">
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
      <svg xmlns="http://www.w3.org/2000/svg" {dimensions(assigns)}  viewBox="0 0 48 48">
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
      <svg xmlns="http://www.w3.org/2000/svg" {dimensions(assigns)} viewBox="0 0 48 48">
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

  def bulb(assigns \\ %{}) do
    ~H"""
      <svg xmlns="http://www.w3.org/2000/svg" {dimensions(assigns)} viewBox="0 0 128 128" style="enable-background:new 0 0 128 128" xml:space="preserve">
        <path style="fill:#51514c" d="M77.547 120.684h-5.765l-1.698 3.012a7.477 7.477 0 0 1-6.513 3.804h-.003a7.479 7.479 0 0 1-6.513-3.804l-1.698-3.012h-5.765v-4.06h27.956v4.06z" />
        <path style="fill:#a7a79b" d="M77.547 113.65H49.591v-4.279h27.956v4.279zm0-11.711H49.591v4.279h27.956v-4.279zm38.587-32.576-12.209-3.271.92-3.434 12.209 3.271-.92 3.434zm-104.268 0-.92-3.434 12.209-3.271.92 3.434-12.209 3.271zm92.979-24.913-.92-3.434 12.209-3.272.92 3.434-12.209 3.272zm-81.69 0-12.209-3.272.92-3.434 12.209 3.272-.92 3.434zM94.82 25.247l-2.514-2.514 8.938-8.938 2.514 2.514-8.938 8.938zm-61.64 0-8.937-8.938 2.514-2.514 8.937 8.938-2.514 2.514zm43.358-11.618-3.434-.92L76.376.5l3.434.92-3.272 12.209zm-25.076 0L48.191 1.42 51.625.5l3.272 12.209-3.435.92z" />
        <path style="fill:#f4d100" d="M59.802 64.141h7.535v34.934h-7.535V64.141zm3.767-44.754c-18.485-.53-33.631 14.817-33.631 33.824 0 9.781 4.016 18.581 10.431 24.753 5.637 5.423 9.222 13.147 9.222 21.111h7.84V64.141H51.75c-4.44 0-8.051-3.612-8.051-8.051s3.612-8.051 8.051-8.051 8.052 3.612 8.052 8.051v5.681h7.535V56.09c0-4.44 3.612-8.051 8.052-8.051 4.44 0 8.051 3.612 8.051 8.051s-3.612 8.051-8.051 8.051h-5.682v34.934h7.84c0-7.964 3.584-15.688 9.222-21.111C93.184 71.792 97.2 62.992 97.2 53.211c0-19.008-15.146-34.355-33.631-33.824zM51.75 50.408a5.687 5.687 0 0 0-5.681 5.681 5.687 5.687 0 0 0 5.681 5.681h5.682v-5.681a5.688 5.688 0 0 0-5.682-5.681zM75.389 61.77h-5.682v-5.681a5.688 5.688 0 0 1 5.682-5.681 5.687 5.687 0 0 1 5.681 5.681 5.687 5.687 0 0 1-5.681 5.681z" />
      </svg>
    """
  end

  def right_arrow(assigns \\ %{}) do
    ~H"""
      <svg xmlns="http://www.w3.org/2000/svg" {dimensions(assigns)} viewBox="0 0 24 24">
        <path d="m21.707 11.293-7-7A1 1 0 0 0 13 5v3H3a1 1 0 0 0-1 1v6a1 1 0 0 0 1 1h10v3a1 1 0 0 0 1.707.707l7-7a1 1 0 0 0 0-1.414z" style="fill:#ff8e31" data-name="Right" />
      </svg>
    """
  end
end
