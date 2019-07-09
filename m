Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65FC663832
	for <lists+kernel-janitors@lfdr.de>; Tue,  9 Jul 2019 16:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbfGIOw3 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 9 Jul 2019 10:52:29 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42152 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726025AbfGIOw3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 9 Jul 2019 10:52:29 -0400
Received: by mail-pf1-f193.google.com with SMTP id q10so9408370pff.9
        for <kernel-janitors@vger.kernel.org>; Tue, 09 Jul 2019 07:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bOo5FIdECv8Dk1vdDxbdUDP2ytSbYy3HpCn39a/nI1k=;
        b=kJQaPdBPe6uBds+wMPLAlAq5MTB/OwElJ+xLcT72OmqhYnRuOQpKFDauzlKzCNTH/o
         Ab2W9s8Hl8l3WQo4KCWreQ6Fe/7COl70EYhwAYBBnwb3wbGV2Mr//c+c3dGHDV3zAc71
         Iod2Yn8Vuo56S91zQ4wNLIB3q/UAZZkHE6IGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bOo5FIdECv8Dk1vdDxbdUDP2ytSbYy3HpCn39a/nI1k=;
        b=PqrP23W/+1Gp1K8jbHskd+vFBXNStzWCx2k4JVf+5GdzsDbU4oYM9ZZKDZFdZT7yNn
         /VkzOQwUOqkzoEWBFJXL9uuTMxCNeU5eHbZTDWr0wTujiCXNYyiWtl+VT5bR1D1CppBI
         YOK2Gw08cs7MNlrKvq4eeJgxmpUJeg7/ZXkX3RLasJm/afDSuj9N6O846CImXarAtTYw
         EHBzlnb40TZ/cRNbr3SuZsmr49hU7vMAr9qW0zy2TqyedzV2j4g6WEiX6iuHiDuyMVk2
         uVNworFsGtjirEHL04TO+yzxi8RoyJFjVPFw4P04gkTUilFCCZLLxQlr1yRfpl/xcTq9
         r/tg==
X-Gm-Message-State: APjAAAUKwb0ZZeTqa/rI3wClEOAT0PBkYpabDPVEuBSk8YG2IGBmoSbN
        X4hGvtqdmrfPvmOxDa0/V4c51g==
X-Google-Smtp-Source: APXvYqwyZy2W00cKZ0x6dz1QCQ2SgqR3O+dVRvJoge+fK1hcKgny3UXngSqShbK6ZpcrsQ87pfiLRw==
X-Received: by 2002:a63:4e60:: with SMTP id o32mr2076697pgl.68.1562683948679;
        Tue, 09 Jul 2019 07:52:28 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id t9sm3022920pji.18.2019.07.09.07.52.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 07:52:28 -0700 (PDT)
Date:   Tue, 9 Jul 2019 07:52:24 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] Bluetooth: hci_qca: Use kfree_skb() instead of
 kfree()
Message-ID: <20190709145224.GO250418@google.com>
References: <20190709013530.11865-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190709013530.11865-1-weiyongjun1@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jul 09, 2019 at 01:35:30AM +0000, Wei Yongjun wrote:
> Use kfree_skb() instead of kfree() to free sk_buff.
> 
> Fixes: 2faa3f15fa2f ("Bluetooth: hci_qca: wcn3990: Drop baudrate change vendor event")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/bluetooth/hci_qca.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 9a5c9c1f9484..cbae86e55aed 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -909,7 +909,7 @@ static int qca_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
>  		if (hdr->evt == HCI_EV_VENDOR)
>  			complete(&qca->drop_ev_comp);
>  
> -		kfree(skb);
> +		kfree_skb(skb);
>  
>  		return 0;
>  	}

Good catch, thanks!

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
