Return-Path: <kernel-janitors+bounces-6941-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3E0A1BFF1
	for <lists+kernel-janitors@lfdr.de>; Sat, 25 Jan 2025 01:43:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06F0C7A47AD
	for <lists+kernel-janitors@lfdr.de>; Sat, 25 Jan 2025 00:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F87B1F942;
	Sat, 25 Jan 2025 00:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cV+rjXER"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DC9BA53
	for <kernel-janitors@vger.kernel.org>; Sat, 25 Jan 2025 00:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737765761; cv=none; b=DwBpYa3/tCzp6Rny5au0Y+c31IgMuY2VQAnKI84SLDJnEvCYBq3aCa8BYFhWQ+zG6ueFWRj8Ix8A7L/BmhP7JMgcixR6TUlr5XV/JtWDQzgYVd+q3QatfW/ytvqcX/HbIy/lCDi0MK6L7r2UTZFmsJuTbAdyKHK2ZylS7barFug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737765761; c=relaxed/simple;
	bh=4jy+OLhpqZHInk4qb29AFovGyww7uHJ9mMKT8hjae78=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ndhzv7R3gf+y7KX1Bv8PMM7z3GNRUmhVqjxrK8f6D2wF7G6mQe/6j+H2sBUFj8l50KgsEkJgkFRerYxFobZZP3srRbpA1A+HSlBQ762MhhrKaaEsFddrYkSd2U/+g9FNYtQGIQenRehA63WKrc4SMPPrzZ5Fl1DIkBGD9RflknY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cV+rjXER; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737765757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MK7dj0TEkuXhy6rMdQfrC3EijRaQ1TSJle0iu1e3X/o=;
	b=cV+rjXERklbq+c83c1DbT5IUBkuT2kAGqEnpIDgPyRo7EdzqIbMTJeENaFPDTJj5qSK1rl
	3l9OtHVlFNxuO11wNj7F2tvfYsm+e75SI6fFnlHLlLqILPiREPgMTTU0v0NOhm+Cq1o0Ql
	9RPvsqk6pLZAQX73XAXgXWGoG91oiss=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-611-didQv12iPGK6TCqDydgeog-1; Fri,
 24 Jan 2025 19:42:33 -0500
X-MC-Unique: didQv12iPGK6TCqDydgeog-1
X-Mimecast-MFC-AGG-ID: didQv12iPGK6TCqDydgeog
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5BBA619560BA;
	Sat, 25 Jan 2025 00:42:31 +0000 (UTC)
Received: from RHTRH0061144 (unknown [10.22.64.79])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EEF9230001BE;
	Sat, 25 Jan 2025 00:42:28 +0000 (UTC)
From: Aaron Conole <aconole@redhat.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: William Tu <u9012063@gmail.com>,  dev@openvswitch.org,
  netdev@vger.kernel.org,  kernel-janitors@vger.kernel.org,
  linux-kernel@vger.kernel.org,  Eric Dumazet <edumazet@google.com>,  Simon
 Horman <horms@kernel.org>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni
 <pabeni@redhat.com>,  "David S. Miller" <davem@davemloft.net>
Subject: Re: [ovs-dev] [PATCH net] net: ovs: prevent underflow in
 queue_userspace_packet()
In-Reply-To: <4d6d9d9e-b4d9-42f1-aa78-1a5979679b2e@stanley.mountain> (Dan
	Carpenter's message of "Fri, 24 Jan 2025 17:49:05 +0300")
References: <4d6d9d9e-b4d9-42f1-aa78-1a5979679b2e@stanley.mountain>
Date: Fri, 24 Jan 2025 19:42:26 -0500
Message-ID: <f7th65nhggd.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Dan Carpenter <dan.carpenter@linaro.org> writes:

> If "hlen" less than "cutlen" then when we call upcall_msg_size()
> the "hlen - cutlen" parameter will be a very high positive
> number.
>
> Later in the function we use "skb->len - cutlen" but this change
> addresses that potential underflow since skb->len is always going to
> be greater than or equal to hlen.
>
> Fixes: f2a4d086ed4c ("openvswitch: Add packet truncation support.")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> From code review not testing.

I think it's pretty difficult to trigger this case.  'cutlen' will only
be set by a TRUNC action attribute, which does a length check there.

>  net/openvswitch/datapath.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/net/openvswitch/datapath.c b/net/openvswitch/datapath.c
> index 225f6048867f..bb25a2bbe8a0 100644
> --- a/net/openvswitch/datapath.c
> +++ b/net/openvswitch/datapath.c
> @@ -477,6 +477,11 @@ static int queue_userspace_packet(struct datapath *dp, struct sk_buff *skb,
>  	else
>  		hlen = skb->len;
>  
> +	if (hlen < cutlen) {
> +		err = -EINVAL;
> +		goto out;
> +	}
> +

I think the right change would be more like:

	if (hlen < cutlen)
		cutlen = 0;

Since trunc is supposed to be a cap on the length to trim
the packet.  If the cut length would be longer than the
packet, then the whole packet should fit.

>  	len = upcall_msg_size(upcall_info, hlen - cutlen,
>  			      OVS_CB(skb)->acts_origlen);
>  	user_skb = genlmsg_new(len, GFP_ATOMIC);


