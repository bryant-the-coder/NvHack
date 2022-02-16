    /*
     * Check if we are able to split the current window and compute its
     * height.
     */
    // Current window requires at least 1 space.
    wmh1 = p_wmh == 0 ? 1 : p_wmh;
    needed = wmh1 + STATUS_HEIGHT;
    if (flags & WSP_ROOM) {
      needed += p_wh - wmh1;
    }
    if (flags & (WSP_BOT | WSP_TOP)) {
      minheight = frame_minheight(topframe, NOWIN) + need_status;
      available = topframe->fr_height;
      needed += minheight;
    } else if (p_ea) {
      minheight = frame_minheight(oldwin->w_frame, NOWIN) + need_status;
      prevfrp = oldwin->w_frame;
      for (frp = oldwin->w_frame->fr_parent; frp != NULL;
           frp = frp->fr_parent) {
        if (frp->fr_layout == FR_COL) {
          FOR_ALL_FRAMES(frp2, frp->fr_child) {
            if (frp2 != prevfrp) {
              minheight += frame_minheight(frp2, NOWIN);
            }
          }
        }
        prevfrp = frp;
      }
      available = topframe->fr_height;
      needed += minheight;
