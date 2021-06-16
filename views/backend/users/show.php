@component('layouts.include.content' , ['title' => ''])

@slot('breadcrumb')

@endslot
@section('sidebar-aaa','active')
@section('sidebar-contents','active menu-open')


@include('users.menu')
<div class="row">
    @can('user-wallet-read')
    <div class=" col-4">
        <div class="card shadow">
            <div class="card-body">
                @if($data['user']->exclude_balance == 1 )
                <div class="alert alert-primary text-center" role="alert">
                    <i class="fas fa-exclamation-triangle ml-1"></i>
                    <span class=""> موجودی این کاربر در گزارش های موجودی محاسبه نمی گردد</span>
                </div>
                @endif
                <div class="card  rounded">
                    <div class="card-body table-responsive p-0">
                        <table class="table table-hover ">
                            <tbody>
                                <tr>
                                    <th class=" pr-5"> ارز / موجودی </th>
                                    <th class="text-center">عملیات</th>
                                </tr>
                                @foreach ($data['currencies'] as $value)
                                <tr class="vertical-align">
                                    <td class="d-flex ">
                                        <div class="col-12">
                                            <div class="row">
                                                <div class="text-center col-4">
                                                    <img class="mb-2" src="{{ asset('/admin/dist/img/currency_photo/'.strtolower($value->title).'.png') }}" alt="بیت‌کوین">
                                                    <div>
                                                        {{ $value->name_fa}}
                                                    </div>
                                                </div>
                                                <div class=" col-8">
                                                    <div>
                                                        <span> کـل :</span>
                                                        <span>{{number_format(($value->wallet->amount ?? 0 ), $value->decimals ) }}</span>
                                                    </div>
                                                    <div>
                                                        <span> آزاد :</span>
                                                        <span>{{ number_format(($value->wallet->tradable_amount ?? 0), $value->decimals)}}</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="text-left ltr">
                                        <a href="{{ route('user.indexByUserCurrency',[$data['user']->id ,$value->id ]) }}" class="btn btn-link p-3">
                                            <small>گردش حساب</small>
                                        </a>
                                        @if ($value->wallet->address ?? '')
                                        <button type="button" class="btn btn-link " data-toggle="modal" data-target="#ModalCenterId_{{$value->id}}">
                                            نمایش آدرس
                                        </button>
                                        <div class="modal fade" id="ModalCenterId_{{$value->id}}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-body">
                                                        <label class="d-block mb-4">
                                                            Address
                                                            <input type="text" class="form-control" placeholder="{{ $value->wallet->address}}" disabled>
                                                        </label>
                                                        @if ($value->wallet->tag ?? '')
                                                        <label class="d-block mb-4">
                                                            Tag
                                                            <input type="text" class="form-control" placeholder="{{ $value->wallet->tag}}" disabled>
                                                        </label>
                                                        @endif
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-danger btn-sm btn-block " data-dismiss="modal">بستن</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        @endif
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <span class="@can('user-wallet-manual-deposit-withdraw') col-4 @else col  @endcan">
                                <form action="{{ route('user.checkWallet',$data['user']->id)}}" method="POST" class="form-check-wallet">
                                    @method('POST')
                                    @csrf
                                    <button type="button" class="btn btn-warning  btn-block form-check-wallet-btn">
                                        <i class='btn-text'>بررسی حساب</i>
                                    </button>
                                </form>
                            </span>
                            @can('user-wallet-manual-deposit-withdraw')
                            <span class="col-8">
                                <button type="button" class="btn btn-info  btn-block" data-toggle="modal" data-target="#DocumentRegistration">
                                    ثبت سند حسابداری
                                </button>
                                <div class="modal fade bd-example-modal-lg" id="DocumentRegistration" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                                        <div class="modal-content">
                                            <div class="modal-body ">

                                                <div class="row p-5">
                                                    <div class="col">
                                                        <div class="form-check text-success m-2 ">
                                                            <button type="button" class="btn btn-outline-success btn-block shadow" data-toggle="buttons" data-form data-hidden=".form-manual-withdraw" data-show=".form-manual-deposit">
                                                                <h5 class="d-inline">
                                                                    واریز
                                                                </h5>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-check text-danger  m-2 ">
                                                            <button type="button" class="btn btn-outline-danger btn-block shadow" data-toggle="buttons" data-form data-hidden=".form-manual-deposit" data-show=".form-manual-withdraw">
                                                                <h5 class="d-inline">
                                                                    برداشت
                                                                </h5>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>










                                                <form action="{{route('user.manualUserWithdrawIrt',$data['user']->id)}}" class="form-manual-withdraw" style="display: none;" method="POST">
                                                    @method('POST')
                                                    @csrf
                                                    <div class="form-group">
                                                        <select class="form-control" name="withdraw_currency">
                                                            <option>انتخاب کنید</option>
                                                            @foreach( $data['currencies'] as $value)
                                                            <option value="{{ $value->id }}">{{ $value->name_fa }} {{ $value->title }}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                    <div class="form-group radio-tag2">
                                                        <label class="d-block mb-4 radios-required">
                                                            مقدار برداشت
                                                            <input autocomplete="off" class="form-control number_format" name="withdraw_amount" placeholder="">
                                                        </label>
                                                        <div class="form-group form-check mt-3 mb-3">
                                                            <label class="form-check-label">
                                                                <input type="checkbox" name="withdraw_tradable" class="form-check-input">
                                                                <b> فقط از موجودی قابل معامله</b>
                                                            </label>
                                                        </div>
                                                        <label class="d-block mb-4 radios-required">
                                                            توضیحات برداشت
                                                            <textarea class="form-control " name="withdraw_description" rows="3" placeholder="لطفا عدم تایید خود را ذکر نمایید .."></textarea>
                                                        </label>
                                                        <button type="submit" class="btn btn-danger btn-block" onclick="return confirm('آیا از ادامه عملیات اطمینان دارید');">ثبت سند برداشت</button>
                                                    </div>
                                                </form>












                                                <form action="{{route('user.manualUserDeposit',$data['user']->id)}}" class="form-manual-deposit" style="display: none;" method="POST">
                                                    @method('POST')
                                                    @csrf
                                                    <div class="form-group">
                                                        <select class="form-control" name="deposit_currency">
                                                            <option>انتخاب کنید</option>
                                                            @foreach( $data['currencies'] as $value)
                                                            <option value="{{ $value->id }}">{{ $value->name_fa }} {{ $value->title }}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                    <div class="form-group radio-tag2">
                                                        <label class="d-block mb-4 radios-required">
                                                            مقدار واریز
                                                            <input autocomplete="off" class="form-control number_format" name="deposit_amount" placeholder="">
                                                        </label>
                                                        <div class="form-group form-check mt-3 mb-3">
                                                            <label class="form-check-label">
                                                                <input type="checkbox" name="deposit_tradable" class="form-check-input">
                                                                <b> فقط از موجودی قابل معامله</b>
                                                            </label>
                                                        </div>
                                                        <label class="d-block mb-4 radios-required">
                                                            توضیحات واریز
                                                            <textarea class="form-control " name="deposit_description" rows="3" placeholder="لطفا عدم تایید خود را ذکر نمایید .."></textarea>
                                                        </label>
                                                        <button type="submit" class="btn btn-success btn-block" onclick="return confirm('آیا از ادامه عملیات اطمینان دارید');">ثبت سند واریز</button>
                                                    </div>
                                                </form>










                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </span>
                            @endcan
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @endcan
    <div class="@can('user-wallet-read') col-8 @else col  @endcan">
        <div class="card shadow z-index">
            <div class="card-body">
                <ul class="progressbar">
                    <li class="{{ $data['user']->getVerificationStatus($data['user']->personal_info_verified)['color'] }}">
                        <div class="margin-top-30">
                            <i class="fas fa-{{ $data['user']->getVerificationStatus($data['user']->personal_info_verified)['icon2'] }}  text-{{ $data['user']->getVerificationStatus($data['user']->personal_info_verified)['color'] }} mb-3"></i>
                        </div>
                        <b>( اطلاعات شخصی )</b>
                    </li>
                    <li class="{{ $data['user']->getBankAccountStatus()['color'] }}">
                        <div class="margin-top-30">
                            <i class=" fas fa-{{ $data['user']->getBankAccountStatus()['icon2'] }} text-{{ $data['user']->getBankAccountStatus()['color'] }} mb-3"></i>
                        </div>
                        <b>( اطلاعات بانکی کاربر )</b>
                    </li>
                    <li class=" {{ $data['user']->getPhoneStatus()['color'] }}">
                        <div class="margin-top-30">
                            <i class=" fas fa-{{ $data['user']->getPhoneStatus()['icon2'] }} text-{{ $data['user']->getPhoneStatus()['color'] }} mb-3"></i>
                        </div>
                        <b>( تلفن ثابت )</b>
                    </li>
                    <li class=" {{ $data['user']->getVerificationStatus($data['user']->address_verified)['color'] }}">
                        <div class="margin-top-30">
                            <i class=" fas fa-{{  $data['user']->getVerificationStatus( $data['user']->address_verified)['icon2'] }} text-{{  $data['user']->getVerificationStatus( $data['user']->address_verified)['color'] }} mb-3"></i>
                        </div>
                        <b>( آدرس )</b>
                    </li>
                    <li class=" {{  $data['user']->getVerificationStatus( $data['user']->auth_pic_verified)['color'] }}">
                        <div class="margin-top-30">
                            <i class=" fas fa-{{  $data['user']->getVerificationStatus( $data['user']->auth_pic_verified)['icon2'] }} text-{{  $data['user']->getVerificationStatus( $data['user']->auth_pic_verified)['color'] }} mb-3"></i>
                        </div>
                        <b>( عکس سلفی )</b>
                    </li>
                </ul>
            </div>
        </div>
        @can('user-auth')
        <div class="card shadow">
            @if ( $data['user']->personal_info_verified == 2 || $data['user']->personal_info_verified === 0)
            <div class="card-body">
                <div class="row mb-3">
                    <div class="col">
                        <label for="firstname">نام :</label>
                        <input class="form-control " id="firstname" type="text" value="{{ $data['user']->firstname }}" disabled>
                    </div>
                    <div class="col">
                        <label for="lastname"> نام خانوادگی :</label>
                        <input class="form-control " id="lastname" type="text" value=" {{ $data['user']->lastname }}" disabled>
                    </div>
                    <div class="col">
                        <label for="father">نام پدر :</label>
                        <input class="form-control mb-3" id="father" type="text" value="{{ $data['user']->father }}" disabled>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col">
                        <label for="national_code">کد ملی :</label>
                        <input class="form-control ltr mb-3" id="national_code" type="text" value="{{ $data['user']->national_code }}" disabled>
                    </div>
                    <div class="col">
                        <label for="birthdate">تاریخ تولد :</label>
                        <input class="form-control ltr mb-3" id="birthdate" type="text" value="{{ $data['user']->birthdate }}" disabled>
                    </div>
                </div>
                <div class="mt-4" id="ajax_national_card_pic_b">
                    <label for="national_code ">عکس کارت ملی :</label>
                    <!-- <img src="{{ asset('/admin/dist/img/national_code.jpeg')}}" id="national_code" class="rounded mx-auto d-block m-3 " alt="national_code"> -->
                </div>
            </div>
            <div class="card-footer">
                <form action="{{route('user.personalInfoVerified',$data['user']->id)}}" id="form_national_card_pic" method="post">
                    @method('POST')
                    @csrf
                    <div class="m-3  ">
                        <div class="form-check text-success mb-2">
                            <label class="form-check-label">
                                <input class="form-check-input radio1" value="1" type="radio" name="personal_info_verified" required {{  $data['user']->personal_info_verified == 1 ? 'checked' : '' }}>
                                <h5 class="d-inline"> تایید </h5>
                            </label>
                        </div>
                        <div class="form-check text-danger ">
                            <label class="form-check-label">
                                <input class="form-check-input radio2 " value="0" type="radio" name="personal_info_verified" {{  $data['user']->personal_info_verified === 0 ? 'checked' : '' }}>
                                <h5 class="d-inline"> عدم تایید </h5>
                            </label>
                        </div>
                    </div>
                    <div class="form-group radio-toggle" style="{{  $data['user']->personal_info_verified === 0 ? 'display: block;' : 'display: none;' }}">
                        <textarea class="form-control radios-required" name="personal_info_textarea" rows="3" placeholder="لطفا عدم تایید خود را ذکر نمایید ..">{{ $data['user']->disapproval_reason_personal_info ?? ''}}</textarea>
                    </div>
                    <button class="btn btn-primary btn-block" onclick="return confirm('آیا از ادامه عملیات اطمینان دارید');" type="submit">ارسال</button>
                </form>
            </div>
            <script>
                $(document).ready(function() {
                    var resultsTag = $('#ajax_national_card_pic_b');
                    resultsTag.html("<img  class='rounded  mx-auto d-block mt-5' src='{{ asset('/admin/dist/img/loading-black.svg') }}' >");
                    $.ajax({
                        url: "{{ route('user.nationalCardPic',$data['user']->id) }}",
                        method: "POST",
                        data: {
                            _token: '{{csrf_token()}}',
                        },
                        success: function(response) {
                            resultsTag.html('<img class="img-fluid rounded  mx-auto d-block m-3" alt="national_code" src="data:image/jpeg;base64,' + response + '"/>');
                        },
                    });
                });
            </script>
            @elseif($data['user']->verifiedBankAccounts->isEmpty() && ($data['user']->unverifiedBankAccounts->isNotEmpty() || $data['user']->waitingBankAccounts->isNotEmpty()))
            <div class="card-body">
                <div class="row mb-3">
                    <div class="col">
                        <label for="firstname"> نام بانک :</label>
                        <input class="form-control " id="firstname" type="text" value="{{ $data['bank_account']->bank_name ?? '' }}" disabled>
                    </div>
                    <div class="col">
                        <label for="lastname"> شماره کارت :</label>
                        <input class="form-control ltr" id="lastname" type="text" value=" {{ $data['bank_account']->card_num ?? '' }}" disabled>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <label for="inlineFormInputGroup">شماره شبا</label>
                        <div class="input-group mb-2">
                            <input type="text" class="form-control ltr" id="inlineFormInputGroup" value="{{ $data['bank_account']->iban_num ?? '' }}" disabled>
                            <div class="input-group-append">
                                <div class="input-group-text">IR</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-footer  border-top">
                <form action="{{route('user.verifiedBankAccounts',$data['user']->id)}}" method="POST">
                    @method('POST')
                    @csrf
                    <input type="hidden" name='bank_account_id' value="{{$data['bank_account']->id ?? ''}}">
                    <div class="row">
                        <div class="col">
                            <div class="m-4">
                                <div class="form-check text-success mb-2">
                                    <label class="form-check-label">
                                        <input class="form-check-input radio1" value="1" type="radio" name="verified_bank_account" {{  $data['bank_account']->verified === 1 ? 'checked' : '' }} required>
                                        <h5 class="d-inline"> تایید </h5>
                                    </label>
                                </div>
                                <div class="form-check text-danger ">
                                    <label class="form-check-label">
                                        <input class="form-check-input radio2 " value="0" type="radio" name="verified_bank_account" {{  $data['bank_account']->verified === 0 ? 'checked' : '' }}>
                                        <h5 class="d-inline"> عدم تایید </h5>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group ml-4 mr-4 mb-3 textarea rounded">
                        <textarea class="form-control " name="verified_bank_accounts_textarea" rows="3" placeholder="لطفا عدم تایید خود را ذکر نمایید ..">{{$data['bank_account']->disapproval_reason ?? ''}}</textarea>
                    </div>
                    <div class="row">
                        <div class="col-3">
                            <button class="btn btn-warning btn-block" type="submit">
                                <i class="btn-text">
                                    بررسی اطلاعات حساب
                                </i>
                            </button>
                        </div>
                        <div class="col-9">
                            <button class="btn btn-info btn-block" onclick="return confirm('آیا از ادامه عملیات اطمینان دارید');" type="submit">ذخیره اطلاعات </button>
                        </div>
                    </div>
                </form>
            </div>
            @elseif(empty($data['user']->phone_verified_at) && !empty($data['user']->phone))
            <div class="alert alert-primary text-center m-4" role="alert">سیستم منتظر تایید تلفن ثابت کاربر است</div>
            @elseif( $data['user']->address_verified == 2 || $data['user']->address_verified === 0 )
            <div class="card-body">
                <div class="row">
                    <div class="col">
                        <input class="form-control" value="{{ $data['user']->province->title  }}" placeholder="آدرسی ثبت نشده..." type="text">
                    </div>
                    <div class="col">
                        <input class="form-control" value="{{ $data['user']->city->title  }}" placeholder="آدرسی ثبت نشده..." type="text">
                    </div>
                </div>
                <div class="row">
                    <div class="col mt-3">
                        <input class="form-control" value="{{ $data['user']->address  }}" placeholder="آدرسی ثبت نشده..." type="text">
                    </div>
                </div>
            </div>
            <div class="card-footer">
                <form action="{{route('user.addressVerified',$data['user']->id)}}" method="POST">
                    @method('POST')
                    @csrf
                    <div class="mb-3  ">
                        <div class="form-check text-success mb-2">
                            <label class="form-check-label">
                                <input class="form-check-input radio1" value="1" type="radio" name="address_verified" required>
                                <h5 class="d-inline"> تایید </h5>
                            </label>
                        </div>
                        <div class="form-check text-danger">
                            <label class="form-check-label">
                                <input class="form-check-input radio2" value="0" type="radio" name="address_verified">
                                <h5 class="d-inline"> عدم تایید </h5>
                            </label>
                        </div>
                    </div>
                    <div class="form-group radio-toggle" style="{{  $data['user']->personalInfoVerified === 0 ? 'display: block;' : 'display: none;' }}">
                        <textarea class="form-control radios-required" name="address_verified_textarea" rows="3" placeholder="لطفا عدم تایید خود را ذکر نمایید ..">{{ $data['user']->disapproval_reason_address ?? '' }}</textarea>
                    </div>
                    <button class="btn btn-info btn-block" onclick="return confirm('آیا از ادامه عملیات اطمینان دارید');" type="submit">ذخیره اطلاعات</button>
                </form>
            </div>
            @elseif( $data['user']->auth_pic_verified == 2 || $data['user']->auth_pic_verified === 0 )
            <div class="card-body">
                <form action="{{route('user.authPicVerified',$data['user']->id)}}" method="POST">
                    @method('POST')
                    @csrf
                    <span id="auth_pic_verified_b">

                    </span>
                    <div class="mb-3">
                        <div class="form-check text-success mb-2">
                            <label class="form-check-label">
                                <input class="form-check-input radio1" value="1" type="radio" name="authPicVerified" required>
                                <h5 class="d-inline"> تایید </h5>
                            </label>
                        </div>
                        <div class="form-check text-danger">
                            <input class="form-check-input radio2" value="0" type="radio" name="authPicVerified">
                            <label class="form-check-label">
                                <h5 class="d-inline"> عدم تایید </h5>
                            </label>
                        </div>
                    </div>
                    <div class="form-group radio-toggle" style="{{  $data['user']->personalInfoVerified === 0 ? 'display: block;' : 'display: none;'}}">
                        <textarea class="form-control radios-required" rows="3" placeholder="لطفا علت عدم تایید خود را ذکر نمایید ..">
                        {{ $data['user']->disapproval_reason_auth_pic ?? '' }}
                        </textarea>
                    </div>
                    <button class="btn btn-primary btn-block" onclick="return confirm('آیا از ادامه عملیات اطمینان دارید');" type="submit">ارسال</button>
                </form>
            </div>
            <script>
                $(document).ready(function() {
                    var resultsTag = $('#auth_pic_verified_b');
                    resultsTag.html("<img  class='rounded  mx-auto d-block mt-5' src='{{ asset('/admin/dist/img/loading-black.svg') }}' >");
                    $.ajax({
                        url: "{{ route('user.picAuthVerify',$data['user']->id) }}",
                        method: "POST",
                        data: {
                            _token: '{{csrf_token()}}',
                        },
                        success: function(response) {
                            resultsTag.html('<img class="img-fluid rounded  mx-auto d-block m-3" alt="national_code" src="data:image/jpeg;base64,' + response + '"/>');
                        },
                    });
                });
            </script>
            @endif
        </div>
        @endcan
        @if (!empty($data['waitingBankAccounts']))
        @can('bank-account-read')
        <div class="card shadow">
            <div class="card-header">
                <h3 class="card-title">حسابهای بانکی در انتظار تایید</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered text-center">
                    <tbody>
                        <tr>
                            <th style="width: 10px">#</th>
                            <th>نام بانک</th>
                            <th>شماره کارت</th>
                            <th>عملیات</th>
                        </tr>
                        @foreach($data['waitingBankAccounts'] as $value)
                        <tr>
                            <td>{{$loop->index + $data['waitingBankAccounts']->firstItem() }}</td>
                            <td>{{ $value->bank_name}}</td>
                            <td>{{ $value->card_num}}</td>
                            </td>
                            <td>
                                <a class="btn btn-warning btn-sm" href="{{ route('user.showBankAccount' , $data['user']->id)}}">مشاهده و بررسی</a>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
        @endcan
        @endif
    </div>
</div>


@include('scripts.script-check-wallet')


<script>
    $(document).ready(function() {


        $(".radio2").click(function() {
            if ($(this).val() == 0) {
                $('.radio-toggle').show(200) + $('.radio-toggle>radios-required').prop('required', true);
            }
        });
        $(".radio1").click(function() {
            if ($(this).val() == 1) {
                $('.radio-toggle').hide(200) + $('.radio-toggle>radios-required').prop('required', false);
            }
        });


        $("button[type='button'][data-form]").click(function() {
            $("button[type='button'][data-form]").removeClass('active');
            $($(this).data('hidden')).slideUp(400);
            $($(this).data('show')).slideDown(400);
        });


    });
</script>

@endcomponent