Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D996A39622
	for <lists+kernel-janitors@lfdr.de>; Fri,  7 Jun 2019 21:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730926AbfFGTru (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 7 Jun 2019 15:47:50 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44414 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729731AbfFGTrt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 7 Jun 2019 15:47:49 -0400
Received: by mail-ot1-f66.google.com with SMTP id b7so2916973otl.11
        for <kernel-janitors@vger.kernel.org>; Fri, 07 Jun 2019 12:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D75maR0BPi0HtwKttPsEOhADh+tYKdFcm9gLoT1aoEI=;
        b=jwcAjyr7csLEfQjDR+72X1vS1eGJ/TRUawPcJ3V0mx/C7/xPGdQ++Qf1Jvhbro9ex4
         M1hNJ0AOdOK7kudWBqdJlcW/31m8h27r1IAW5zaevIzuIzYpkzPdmug1Sb3VS9fLtHgY
         j0tdspXg9C80XV9OG4m4LEoLB5CIPJSv+/gKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D75maR0BPi0HtwKttPsEOhADh+tYKdFcm9gLoT1aoEI=;
        b=mygY5j9WKb2TxCU++bzVbGU4r7ywcan7NTWupxuL61ds5n7MWUenJGHaL5FoGI15ch
         iigp81tVd+GSNpVSjDom+aSqekdivuLY9dIR0XucfviK72yqE5QA7PHc8ZzRM1ydGhHE
         TfFwc0GsUFp1/97QGawLJYzlj3Ad7je0h1kHZR1xR1LVLW020eaj8+1IGcmKMlt7jn5g
         GRiYh5tmiS6THOPKHcAZbMgs5FNoqsTKk+kt03cQXj22MwksiADTMA2pBWx0W27oWsBc
         C9UaOro2Q1OtOLh0BOcsB4fFxXFc7rjcLblQt7ooKmJCwIBO5XfyjUFquaSaxzblQesp
         jWHg==
X-Gm-Message-State: APjAAAWLPhh9psTU2uVkU2/TG/KEVrZSe9Z1d5XMlcLctdXuR9ZIiigI
        Bxz/LU4v+Wwy9NOlcORR9gbdK42I4Xc=
X-Google-Smtp-Source: APXvYqzVZWCFdzCGyl//oYucmAc6RsVeHMBpphNxh8wQ4V9w62ovNOcpNG+IR7UZ6oOWnAQKkEI3BA==
X-Received: by 2002:a9d:5909:: with SMTP id t9mr9005692oth.120.1559936868954;
        Fri, 07 Jun 2019 12:47:48 -0700 (PDT)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com. [209.85.210.48])
        by smtp.gmail.com with ESMTPSA id l65sm1028451oif.20.2019.06.07.12.47.47
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 12:47:48 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id z23so2915616ote.13
        for <kernel-janitors@vger.kernel.org>; Fri, 07 Jun 2019 12:47:47 -0700 (PDT)
X-Received: by 2002:a9d:66d8:: with SMTP id t24mr6500815otm.349.1559936867509;
 Fri, 07 Jun 2019 12:47:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190607081841.GA27206@mwanda>
In-Reply-To: <20190607081841.GA27206@mwanda>
From:   Nick Crews <ncrews@chromium.org>
Date:   Fri, 7 Jun 2019 13:47:36 -0600
X-Gmail-Original-Message-ID: <CAHX4x87HsSsFS1kAy5KM4d+D8gcs2=0_oOL+5-X74Y0zZroAhA@mail.gmail.com>
Message-ID: <CAHX4x87HsSsFS1kAy5KM4d+D8gcs2=0_oOL+5-X74Y0zZroAhA@mail.gmail.com>
Subject: Re: [bug report] platform/chrome: wilco_ec: Add event handling
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jun 7, 2019 at 2:18 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Hello Nick Crews,
>
> The patch f7b0bc5eafa4: "platform/chrome: wilco_ec: Add event
> handling" from May 23, 2019, leads to the following static checker
> warning:
>
>   drivers/platform/chrome/wilco_ec/event.c:352 event_read()
>   warn: inconsistent returns 'dev_data->lock'.
>     Locked on  : 345
>     Unlocked on: 323,333,352
>
> drivers/platform/chrome/wilco_ec/event.c
>    306  static ssize_t event_read(struct file *filp, char __user *buf, size_t count,
>    307                            loff_t *pos)
>    308  {
>    309          struct event_device_data *dev_data = filp->private_data;
>    310          struct ec_event_entry *entry;
>    311          ssize_t n_bytes_written = 0;
>    312          int err;
>    313
>    314          /* We only will give them the entire event at once */
>    315          if (count != 0 && count < EC_ACPI_MAX_EVENT_SIZE)
>    316                  return -EINVAL;
>    317
>    318          mutex_lock(&dev_data->lock);
>    319
>    320          while (dev_data->num_events == 0) {
>    321                  if (filp->f_flags & O_NONBLOCK) {
>    322                          mutex_unlock(&dev_data->lock);
>    323                          return -EAGAIN;
>    324                  }
>    325                  /* Need to unlock so that data can actually get added to the
>    326                   * queue, and since we recheck before use and it's just
>    327                   * comparing pointers, this is safe unlocked.
>    328                   */
>    329                  mutex_unlock(&dev_data->lock);
>    330                  err = wait_event_interruptible(dev_data->wq,
>    331                                                 dev_data->num_events);
>    332                  if (err)
>    333                          return err;
>    334
>    335                  /* Device was removed as we waited? */
>    336                  if (!dev_data->exist)
>    337                          return -ENODEV;
>    338                  mutex_lock(&dev_data->lock);
>    339          }
>    340
>    341          entry = list_first_entry(&dev_data->events,
>    342                                   struct ec_event_entry, list);
>    343          n_bytes_written = entry->size;
>    344          if (copy_to_user(buf, &entry->event, n_bytes_written))
>    345                  return -EFAULT;
>
> We need to unlock here.  But also maybe we should do other error
> handling like the list_del() as well?  I'm not sure.

Thanks, I'll look into this.

Enric, should I submit a completely new version of this,
or just a patch on top of this? Also, I still want to add in
the circular buffer for events to prevent OOM.

Nick

>
>    346          list_del(&entry->list);
>    347          kfree(entry);
>    348          dev_data->num_events--;
>    349
>    350          mutex_unlock(&dev_data->lock);
>    351
>    352          return n_bytes_written;
>    353  }
>
> regards,
> dan carpenter
