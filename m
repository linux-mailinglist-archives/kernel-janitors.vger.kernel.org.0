Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52E801A85E4
	for <lists+kernel-janitors@lfdr.de>; Tue, 14 Apr 2020 18:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502189AbgDNQvX (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 14 Apr 2020 12:51:23 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38015 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2440666AbgDNQvS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Apr 2020 12:51:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586883076;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xEwW/84Bx+Wn4UVzdKy29mX/tgdsrLXZkRwHZ2M75ns=;
        b=DjGBqcA7rnM6nHmDaZdDoDfvH4H4Mm1X1Kg7UW7+cKqN+QjCT5kcwfae4+k04L/8ZLCKr9
        gRD4MDQjJGYgPqOXM/oCHCYlUMhwlrZW8cT4DoZ3Xo3WBgcYmWu2zbAxVqWtA5BvZMxZwI
        d3XhyNaMahxTHqGd1HsAZHpVEHA1uN4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-hpGTtmmmPk-U0-UeP2CQnw-1; Tue, 14 Apr 2020 12:51:15 -0400
X-MC-Unique: hpGTtmmmPk-U0-UeP2CQnw-1
Received: by mail-wm1-f71.google.com with SMTP id h184so945032wmf.5
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Apr 2020 09:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=xEwW/84Bx+Wn4UVzdKy29mX/tgdsrLXZkRwHZ2M75ns=;
        b=LbWirRy0aYqBn5855Q7EcGXhT+B2bwShbTSli+sCcbIN/TVaoUa9yDpbRqvJlG+Nvl
         5ODom0gayt0Xp6cf8YiPhiP9z5M7u9Slgx7FQo97L/B2BZ4UhKwCpKRXvQ/tNvNU2OXM
         Bm0bHzGfMLL5hj1TiRhKOx12z/fqNEfUCzOWSQL7zUSfXEldIO70zE4GKdNQrGrGRJoS
         VSdjrv2uEjUVPBWemDtxb16gvAfubduSjoOaLPSGSisZk4wwAc3vp7NLf3hQa+DuEzai
         mA6KExCTQ6Cgtjqaj67nt44kYKSqOSFrzji6G40maWr7XsMxUW+scWShWsGI/El2S7lF
         nXog==
X-Gm-Message-State: AGi0PuYbdHApFYYWgmXGtbz9A5xav13nnfr/h0femHImeNOOuafb6v10
        jjWzsA9JO1VOw8dxy12e5IYHhCHIy4qrlhe/cRVoVpJQFF7IurVLeTFRBFuir+4HCozIjzHtWg8
        t57SrgVeH+z1/vu13u6IUPiiO7HA6
X-Received: by 2002:a05:600c:2314:: with SMTP id 20mr809884wmo.118.1586883073922;
        Tue, 14 Apr 2020 09:51:13 -0700 (PDT)
X-Google-Smtp-Source: APiQypJCdYCN7qTchgvOqHA8okoWjFJVzrdCxgqqIR560y3Z2b+3g4AVFAj455QlShPovTl9i6iVNA==
X-Received: by 2002:a05:600c:2314:: with SMTP id 20mr809859wmo.118.1586883073583;
        Tue, 14 Apr 2020 09:51:13 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
        by smtp.gmail.com with ESMTPSA id t20sm9185423wmi.2.2020.04.14.09.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 09:51:12 -0700 (PDT)
From:   Vitaly Kuznetsov <vkuznets@redhat.com>
To:     Colin King <colin.king@canonical.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        "K . Y . Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Stephen Hemminger <sthemmin@microsoft.com>,
        Wei Liu <wei.liu@kernel.org>, linux-hyperv@vger.kernel.org
Subject: Re: [PATCH][next] drivers: hv: remove redundant assignment to pointer primary_channel
In-Reply-To: <20200414152343.243166-1-colin.king@canonical.com>
References: <20200414152343.243166-1-colin.king@canonical.com>
Date:   Tue, 14 Apr 2020 18:51:11 +0200
Message-ID: <87d08axb7k.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Colin King <colin.king@canonical.com> writes:

> From: Colin Ian King <colin.king@canonical.com>
>
> The pointer primary_channel is being assigned with a value that is never,
> The assignment is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/hv/channel_mgmt.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/hv/channel_mgmt.c b/drivers/hv/channel_mgmt.c
> index ffd7fffa5f83..f7bbb8dc4b0f 100644
> --- a/drivers/hv/channel_mgmt.c
> +++ b/drivers/hv/channel_mgmt.c
> @@ -425,8 +425,6 @@ void hv_process_channel_removal(struct vmbus_channel *channel)
>  
>  	if (channel->primary_channel == NULL) {
>  		list_del(&channel->listentry);
> -
> -		primary_channel = channel;
>  	} else {
>  		primary_channel = channel->primary_channel;
>  		spin_lock_irqsave(&primary_channel->lock, flags);

If I'm looking at the right source (5.7-rc1) it *is* beeing used:

	if (channel->primary_channel == NULL) {
		list_del(&channel->listentry);

		primary_channel = channel;
	} else {
		primary_channel = channel->primary_channel;
		spin_lock_irqsave(&primary_channel->lock, flags);
		list_del(&channel->sc_list);
		spin_unlock_irqrestore(&primary_channel->lock, flags);
	}

	/*
	 * We need to free the bit for init_vp_index() to work in the case
	 * of sub-channel, when we reload drivers like hv_netvsc.
	 */
	if (channel->affinity_policy == HV_LOCALIZED)
		cpumask_clear_cpu(channel->target_cpu,
				  &primary_channel->alloced_cpus_in_node);
                                   ^^^^^ HERE ^^^^^

-- 
Vitaly

