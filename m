Return-Path: <kernel-janitors+bounces-64-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB1E7DC9B9
	for <lists+kernel-janitors@lfdr.de>; Tue, 31 Oct 2023 10:36:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2DF0B2105E
	for <lists+kernel-janitors@lfdr.de>; Tue, 31 Oct 2023 09:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C871549A;
	Tue, 31 Oct 2023 09:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58671805D
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 09:35:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8EC13B7;
	Tue, 31 Oct 2023 02:35:58 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13A1FC15;
	Tue, 31 Oct 2023 02:36:40 -0700 (PDT)
Received: from [10.1.34.45] (unknown [10.1.34.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB5323F67D;
	Tue, 31 Oct 2023 02:35:56 -0700 (PDT)
Message-ID: <b50c2963-8eae-452f-98c6-03293bcca1a2@arm.com>
Date: Tue, 31 Oct 2023 09:35:54 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] dm delay: Fix missing error code in delay_ctr()
Content-Language: en-US
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
 error27@gmail.com
References: <20231031071000.374939-1-harshit.m.mogalapalli@oracle.com>
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20231031071000.374939-1-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/10/2023 07:10, Harshit Mogalapalli wrote:
> When worker thread allocation fails, return error instead of
> zero(success).
> 
> Also when kthread_create fails it returns ERR pointers and not NULL, so
> fix that as well.
> 
> Fixes: c1fce71d29b2 ("dm delay: for short delays, use kthread instead of timers and wq")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> Smatch complained about the missing error code.
> This patch is only compile tested.
> ---
>  drivers/md/dm-delay.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-delay.c b/drivers/md/dm-delay.c
> index 3d91804923eb..efd510984e25 100644
> --- a/drivers/md/dm-delay.c
> +++ b/drivers/md/dm-delay.c
> @@ -280,8 +280,10 @@ static int delay_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  		 */
>  		dc->worker = kthread_create(&flush_worker_fn, dc,
>  					    "dm-delay-flush-worker");
> -		if (!dc->worker)
> +		if (IS_ERR(dc->worker)) {
> +			ret = PTR_ERR(dc->worker);
>  			goto bad;
> +		}
>  	} else {
>  		timer_setup(&dc->delay_timer, handle_delayed_timer, 0);
>  		INIT_WORK(&dc->flush_expired_bios, flush_expired_bios);
Reviewed-by: Christian Loehle <christian.loehle@arm.com>

Thanks!

