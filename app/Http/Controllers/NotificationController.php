<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class NotificationController extends Controller
{
    /**
     * Display all notifications for the authenticated user
     */
    public function index()
    {
        // Get all notifications for the authenticated user, ordered by newest first
        $notifications = auth()->user()->notifications()->latest()->paginate(15);
        return view('notifications.index', compact('notifications'));
    }
    
    /**
     * Mark a specific notification as read
     */
    public function markAsRead($id)
    {
        // Mark a specific notification as read
        $notification = auth()->user()->notifications()->findOrFail($id);
        $notification->markAsRead();
        
        return back()->with('success', 'Notification marquée comme lue');
    }
    
    /**
     * Mark all notifications as read
     */
    public function markAllAsRead()
    {
        // Mark all unread notifications as read
        auth()->user()->unreadNotifications->markAsRead();
        
        return back()->with('success', 'Toutes les notifications ont été marquées comme lues');
    }
    
    /**
     * Delete a specific notification
     */
    public function delete($id)
    {
        $notification = auth()->user()->notifications()->findOrFail($id);
        $notification->delete();
        
        return back()->with('success', 'Notification supprimée avec succès');
    }
    
    /**
     * Get unread notifications count (for AJAX - optional)
     */
    public function unreadCount()
    {
        $count = auth()->user()->unreadNotifications->count();
        
        return response()->json(['count' => $count]);
    }
}