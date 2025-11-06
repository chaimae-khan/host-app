@extends('dashboard.index')

@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h4 class="card-title mb-0">Notifications</h4>
                    @if($notifications->where('read_at', null)->count() > 0)
                        <form action="{{ route('notifications.markAllAsRead') }}" method="POST">
                            @csrf
                            <button type="submit" class="btn btn-sm btn-outline-secondary">
                                <i class="fa-solid fa-check-double"></i> Tout marquer comme lu
                            </button>
                        </form>
                    @endif
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th width="5%"><i class="fa-solid fa-envelope"></i></th>
                                    <th width="45%">Message</th>
                                    <th width="15%">Statut</th>
                                    <th width="20%">Date</th>
                                    <th width="15%">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($notifications as $notification)
                                    <tr class="{{ $notification->read_at ? '' : 'table-info' }}" style="{{ $notification->read_at ? 'opacity: 0.7;' : '' }}">
                                        <td class="text-center">
                                            @if(!$notification->read_at)
                                                <i class="fa-solid fa-envelope text-primary"></i>
                                            @else
                                                <i class="fa-solid fa-envelope-open text-muted"></i>
                                            @endif
                                        </td>
                                        <td>
                                            <strong>{{ $notification->data['message'] }}</strong>
                                            @if(!$notification->read_at)
                                                <span class="badge bg-primary ms-2">Nouveau</span>
                                            @endif
                                        </td>
                                        <td>
                                            @if(isset($notification->data['status']))
                                                @php
                                                    $status = $notification->data['status'];
                                                    $badgeClass = 'secondary';
                                                    $icon = 'fa-info-circle';
                                                    
                                                    switch($status) {
                                                        case 'Stock Bas':
                                                            $badgeClass = 'warning';
                                                            $icon = 'fa-exclamation-triangle';
                                                            break;
                                                        case 'Validation':
                                                            $badgeClass = 'success';
                                                            $icon = 'fa-check-circle';
                                                            break;
                                                        case 'Refus':
                                                            $badgeClass = 'danger';
                                                            $icon = 'fa-times-circle';
                                                            break;
                                                        case 'Visé':
                                                            $badgeClass = 'info';
                                                            $icon = 'fa-eye';
                                                            break;
                                                        case 'Réception':
                                                            $badgeClass = 'primary';
                                                            $icon = 'fa-box';
                                                            break;
                                                        case 'Livraison':
                                                            $badgeClass = 'success';
                                                            $icon = 'fa-truck';
                                                            break;
                                                    }
                                                @endphp
                                                <span class="badge bg-{{ $badgeClass }}">
                                                    <i class="fa-solid {{ $icon }}"></i> {{ $status }}
                                                </span>
                                            @endif
                                        </td>
                                        <td>
                                            <small>
                                                <i class="fa-solid fa-clock"></i> 
                                                {{ $notification->created_at->format('d/m/Y H:i') }}
                                                <br>
                                                <span class="text-muted">{{ $notification->created_at->diffForHumans() }}</span>
                                            </small>
                                        </td>
                                        <td>
                                            <div class="btn-group" role="group">
                                                @if(isset($notification->data['view_url']))
                                                    <a href="{{ $notification->data['view_url'] }}" 
                                                       class="btn btn-sm btn-outline-primary"
                                                       onclick="markAsRead('{{ $notification->id }}')">
                                                        <i class="fa-solid fa-eye"></i> Voir
                                                    </a>
                                                @endif
                                                
                                                @if(!$notification->read_at)
                                                    <form action="{{ route('notifications.markAsRead', $notification->id) }}" 
                                                          method="POST" 
                                                          style="display: inline;">
                                                        @csrf
                                                        <button type="submit" 
                                                                class="btn btn-sm btn-outline-success"
                                                                title="Marquer comme lu">
                                                            <i class="fa-solid fa-check"></i>
                                                        </button>
                                                    </form>
                                                @endif
                                                
                                                <form action="{{ route('notifications.delete', $notification->id) }}" 
                                                      method="POST" 
                                                      style="display: inline;"
                                                      onsubmit="return confirm('Êtes-vous sûr de vouloir supprimer cette notification ?');">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" 
                                                            class="btn btn-sm btn-outline-danger"
                                                            title="Supprimer">
                                                        <i class="fa-solid fa-trash"></i>
                                                    </button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="5" class="text-center py-5">
                                            <i class="fa-solid fa-bell-slash fa-3x text-muted mb-3"></i>
                                            <p class="text-muted">Aucune notification trouvée.</p>
                                        </td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                    
                    <div class="mt-3">
                        {{ $notifications->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
function markAsRead(notificationId) {
    fetch(`/notifications/${notificationId}/mark-as-read`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
        }
    });
}
</script>

<style>
.table-hover tbody tr:hover {
    background-color: rgba(0, 123, 255, 0.05);
}

.btn-group .btn {
    margin-right: 2px;
}

.badge {
    font-size: 0.85em;
    padding: 0.35em 0.65em;
}
</style>
@endsection