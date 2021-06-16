@component('admin.layouts.include.content' , ['title' => 'لیست کاربران'])

@slot('breadcrumb')
<li class="breadcrumb-item "><a href="/">پنل مدیریت</a></li>
<li class="breadcrumb-item "><a href="{{url('user')}}"> مدیریت کاربران</a></li>
<li class="breadcrumb-item active">لیست کاربران</li>
@endslot
@section('sidebar-user','active')
@section('sidebar-users','active menu-open')



<div class="card ">
    <div class="card-header">
        <div class="card-body ">
            <div class="card-tools">
                <form action="{{route('user.index')}}" method='get' autocomplete="off">
                    <input type="hidden" name="waiting" value="{{ request()->query('waiting') }}">
                    <div class="form-row col-md-12">
                        <div class="form-group col-md-3">
                            <input autocomplete="off" type="text" class="form-control" name="name" value="{{ request()->query('name') }}" placeholder="نام و نام خانوادگی">
                        </div>
                        <div class="form-group col-md-3">
                            <input autocomplete="off" type="text" class="form-control" name="national_code" value="{{ request()->query('national_code') }}" placeholder="کد ملی">
                        </div>
                        <div class="form-group col-md-3">
                            <input autocomplete="off" type="text" class="form-control" name="phone" value="{{ request()->query('mobile') }}" placeholder="شماره همراه">
                        </div>
                        <div class="form-group col-md-3">
                            <input autocomplete="off" type="text" class="form-control" name="email" value="{{ request()->query('email') }}" placeholder="ایمیل">
                        </div>
                    </div>
                    <div class="form-row col-md-12">
                        <div class="form-group col-md-3">
                            <input autocomplete="off" type="text" class="form-control" name="code" value="{{ request()->query('code') }}" placeholder="شناسه کاربر">
                        </div>
                        <div class="form-group col-md-3">
                            <input autocomplete="off" type="text" class="form-control" name="user_id" value="{{ request()->query('user_id') }}" placeholder="tblid کاربر">
                        </div>

                    </div>
                    <div class="form-row col-md-12">
                        <div class="offset-md-9"></div>
                        <div class="form-group col-md-1 "">
                                <a class=" btn btn-danger btn-block mr-1" href="{{route('user.index')}}">
                            <i class="fa fa-times"></i>
                            </a>
                        </div>
                        <div class="form-group col-md-2 vertical-align">
                            <button type="submit" name='search' value='1' class="btn btn-success btn-block mr-2 vertical-align d-flex justify-content-between align-items-center">
                                <span> جستجو موارد</span> <i class="fa fa-search vertical-align"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="card-body table-responsive p-0">
        <table class="table table-hover">
            <thead>
                <div class="text-left m-2">
                    <span>{{$data['users']->firstItem()}} تا</span>
                    <span>{{$data['users']->lastItem()}} </span>
                    / <span>{{$data['users']->total()}} مورد</span>
                </div>
            </thead>
            <tbody>
                <tr>
                    <th class="text-center">ردیف</th>
                    <th class="text-center">شناسه</th>
                    <th>مشخصات</th>
                    <th>اطلاعات ورود</th>
                    <th class="text-center">عملیات</th>
                </tr>
                @forelse ($data['users'] as $value)
                <tr class="vertical-align">
                    <td class="text-center" width="10px">{{$loop->index + $data['users']->firstItem() }}</td>
                    <td class="text-center">
                        <span>{{ App\Helpers\TableCodeHelper::id2Code($value->id) }}<sub class="text-muted">/{{ $value->id }}</sub></span>
                    </td>
                    <td>
                        <div>
                            <span>{{ $value->name }}</span>
                            <span>{{ $value->family }}</span>
                        </div>
                        <div>
                            <small>{{ $value->email }}</small>
                        </div>
                        <div>
                            <small>{{ $value->phone }}</small>
                        </div>
                        <div>
                            <small>{{ $value->national_code }}</small>
                        </div>
                    </td>
                    <td>
                        <div>
                            <small>ورود دو عاملی : </small>
                            @if(!$value->two_factor_secret)
                            <i class="fa fa-times text-danger"></i>
                            @else
                            <i class="fa fa-check text-success"></i>
                            <small>
                                {{ $value->two_fa }}
                            </small>
                            @endif
                        </div>
                        <div>
                            <small>آخرین ورود : </small>
                            <small>
                                <bdi class="arabic-num">{{ $value->loginLog ? \App\Helpers\DateTimeHelper::getDateTime($value->loginLog->created_at->timestamp) : " -- " }}</bdi>
                            </small>
                        </div>
                        <div>
                            <small>وضعیت کاربر : </small>
                            @if($value->enabled)
                            <i class="fa fa-check text-success"></i>
                            @else
                            <i class="fa fa-times text-danger"></i>
                            @endif
                        </div>
                        <div>
                            @if($value->user_level_id ===1)
                            <small>مبتدی:</small>
                            <i class="fa fa-star text-lighter"></i>
                            @elseif($value->user_level_id ===2)
                            <small>نقره ای : </small>
                            <i class="fa fa-star text-secondary"></i>
                            <i class="fa fa-star text-secondary"></i>
                            @elseif($value->user_level_id ===3)
                            <small>وفادار : </small>
                            <i class="fa fa-star text-warning"></i>
                            <i class="fa fa-star text-warning"></i>
                            <i class="fa fa-star text-warning"></i>
                            @elseif($value->user_level_id ===4)
                            <small>VIP : </small>
                            <i class="fa fa-star text-warning"></i>
                            <i class="fa fa-star text-warning"></i>
                            <i class="fa fa-star text-warning"></i>
                            <i class="fa fa-star text-warning"></i>
                            @endif
                        </div>
                    </td>
                    <td class="text-center">
                        <div class="row mb-1 p-1">
                            <a href="{{ route('user.show',$value->id) }}" class="btn btn-light btn-sm rounded vertical-align col-6">مشاهده جزئیات</a>
                            @if($value->is_staff)
                            <a href="{{ route('user.permission',$value->id) }}" class="btn btn-light btn-sm rounded vertical-align col-6"> دسترسی ها</a>
                            @endif
                        </div>
                    </td>
                </tr>

                @empty
                <tr class="alert alert-secondary" role="alert">
                    <td colspan="10">
                        آیتمی برای نمایش وجود ندارد
                    </td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
    <div class="card-footer">
        <span class="float-left">
            {{ $data['users']->links()  }}
        </span>
    </div>
</div>



@endcomponent