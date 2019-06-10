Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 765803B248
	for <lists+kernel-janitors@lfdr.de>; Mon, 10 Jun 2019 11:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388738AbfFJJg6 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 10 Jun 2019 05:36:58 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56168 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388511AbfFJJg6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 Jun 2019 05:36:58 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 77E6B284C4A
Subject: Re: [bug report] platform/chrome: wilco_ec: Add event handling
To:     Nick Crews <ncrews@chromium.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
References: <20190607081841.GA27206@mwanda>
 <CAHX4x87HsSsFS1kAy5KM4d+D8gcs2=0_oOL+5-X74Y0zZroAhA@mail.gmail.com>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <58ebdcaa-12b1-00e9-5260-d30d18f7957e@collabora.com>
Date:   Mon, 10 Jun 2019 11:36:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAHX4x87HsSsFS1kAy5KM4d+D8gcs2=0_oOL+5-X74Y0zZroAhA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Nick,

On 7/6/19 21:47, Nick Crews wrote:
> On Fri, Jun 7, 2019 at 2:18 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>>
>> Hello Nick Crews,
>>
>> The patch f7b0bc5eafa4: "platform/chrome: wilco_ec: Add event
>> handling" from May 23, 2019, leads to the following static checker
>> warning:
>>
>>   drivers/platform/chrome/wilco_ec/event.c:352 event_read()
>>   warn: inconsistent returns 'dev_data->lock'.
>>     Locked on  : 345
>>     Unlocked on: 323,333,352
>>
>> drivers/platform/chrome/wilco_ec/event.c
>>    306  static ssize_t event_read(struct file *filp, char __user *buf, size_t count,
>>    307                            loff_t *pos)
>>    308  {
>>    309          struct event_device_data *dev_data = filp->private_data;
>>    310          struct ec_event_entry *entry;
>>    311          ssize_t n_bytes_written = 0;
>>    312          int err;
>>    313
>>    314          /* We only will give them the entire event at once */
>>    315          if (count != 0 && count < EC_ACPI_MAX_EVENT_SIZE)
>>    316                  return -EINVAL;
>>    317
>>    318          mutex_lock(&dev_data->lock);
>>    319
>>    320          while (dev_data->num_events == 0) {
>>    321                  if (filp->f_flags & O_NONBLOCK) {
>>    322                          mutex_unlock(&dev_data->lock);
>>    323                          return -EAGAIN;
>>    324                  }
>>    325                  /* Need to unlock so that data can actually get added to the
>>    326                   * queue, and since we recheck before use and it's just
>>    327                   * comparing pointers, this is safe unlocked.
>>    328                   */
>>    329                  mutex_unlock(&dev_data->lock);
>>    330                  err = wait_event_interruptible(dev_data->wq,
>>    331                                                 dev_data->num_events);
>>    332                  if (err)
>>    333                          return err;
>>    334
>>    335                  /* Device was removed as we waited? */
>>    336                  if (!dev_data->exist)
>>    337                          return -ENODEV;
>>    338                  mutex_lock(&dev_data->lock);
>>    339          }
>>    340
>>    341          entry = list_first_entry(&dev_data->events,
>>    342                                   struct ec_event_entry, list);
>>    343          n_bytes_written = entry->size;
>>    344          if (copy_to_user(buf, &entry->event, n_bytes_written))
>>    345                  return -EFAULT;
>>
>> We need to unlock here.  But also maybe we should do other error
>> handling like the list_del() as well?  I'm not sure.
> 
> Thanks, I'll look into this.
> 
> Enric, should I submit a completely new version of this,
> or just a patch on top of this? Also, I still want to add in
> the circular buffer for events to prevent OOM.
> 

Two patches on top, the first one addind the Reported-by tag.

 Enric

> Nick
> 
>>
>>    346          list_del(&entry->list);
>>    347          kfree(entry);
>>    348          dev_data->num_events--;
>>    349
>>    350          mutex_unlock(&dev_data->lock);
>>    351
>>    352          return n_bytes_written;
>>    353  }
>>
>> regards,
>> dan carpenter
