@component('admin.layouts.include.content' , ['title' => 'ثبت دسترسی'])

@slot('breadcrumb')
<li class="breadcrumb-item "><a href="{{ url('/') }}">پنل مدیریت</a></li>
<li class="breadcrumb-item "><a href="{{ route('role.store') }}">لیست کاربران</a></li>
<li class="breadcrumb-item active">ثبت دسترسی</li>
@endslot
@section('sidebar-user','active')
@section('sidebar-users','active menu-open')

@slot('script')
<script>
    $('#roles').select2({
        'placeholder': 'نقش مورد نظر را انتخاب کنید'
    });
    $('#permissions').select2({
        'placeholder': 'دسترسی مورد نظر را انتخاب کنید'
    })
</script>
@endslot
<div class="col-12">
    <div class="card">

        <!-- /.card-header -->
        <!-- form start -->
        <form class="form-horizontal" action="{{ route('user.permission.store' ,$user->id) }}" method="POST">
            @csrf
            <div class="card-body">

                <div class="col-lg-12">
                    <div class="form-group">
                        <select type="text" class="form-control " name="permissions[]" id="permissions"  multiple>
                            @foreach(App\Models\Permission::all() as $permission )
                            <option value="{{ $permission->id }}" {{ in_array($permission->id ,$user->permissions->pluck('id')->toArray())? 'selected' : '' }}>{{ $permission->name }} - {{ $permission->label }}</option>
                            @endforeach
                        </select>
                    </div>

                    <div class="form-group">
                        <select type="text" class="form-control " name="roles[]" id="roles"  multiple>
                            @foreach(App\Models\Role::all() as $role )
                            <option value="{{ $role->id }}" {{ in_array($role->id ,$user->roles->pluck('id')->toArray())? 'selected' : '' }}>{{ $role->name }} - {{ $role->label }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
            </div>

            <!-- /.card-body -->
            <div class="card-footer">
                <span class="float-right">
                    <button type="submit" class="btn btn-info "> ذخیره اطلاعات</button>
                </span>
                <span class="float-left">
                    <a href="{{ route('user.index') }}" class="btn btn-secondary"> بازگشت به لیست</a>
                </span>
            </div>
            <!-- /.card-footer -->
        </form>
    </div>

</div>




@endcomponent