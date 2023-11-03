Return-Path: <kernel-janitors+bounces-130-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFF27DFDDC
	for <lists+kernel-janitors@lfdr.de>; Fri,  3 Nov 2023 03:09:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58AD8281CE0
	for <lists+kernel-janitors@lfdr.de>; Fri,  3 Nov 2023 02:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236D9137C;
	Fri,  3 Nov 2023 02:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D7E1119
	for <kernel-janitors@vger.kernel.org>; Fri,  3 Nov 2023 02:08:59 +0000 (UTC)
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 5B464196;
	Thu,  2 Nov 2023 19:08:57 -0700 (PDT)
Received: from [172.30.11.106] (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 174C76082CF9C;
	Fri,  3 Nov 2023 10:08:46 +0800 (CST)
Message-ID: <fc093d05-e624-40f2-a12c-281a75af889e@nfschina.com>
Date: Fri, 3 Nov 2023 10:08:45 +0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH][V2] x86/lib: Fix overflow of variable m when val >=
 1410065408
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <20231102174901.2590325-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/11/3 01:49, Colin Ian King wrote:
> There is an overflow in variable m in function num_digits when val
> is >= 1410065408 which leads to the digit calculation loop to
> iterate more times than required. This results in either more
> digits being counted or in some cases (for example where val is
> 1932683193) the value of m eventually overflows to zero and the
> while loop spins forever).
>
> Currently the function num_digits is currently only being used for
> small values of val in the SMP boot stage for digit counting on the
> number of cpus and NUMA nodes, so the overflow is never encountered.
> However it is useful to fix the overflow issue in case the function
> is used for other purposes in the future. (The issue was discovered
> while investigating the digit counting performance in various
> kernel helper functions rather than any real-world use-case).
>
> The simplest fix is to make m a long long, the overhead in
> multiplication speed for a long long is very minor for small values
> of val less than 10000 on modern processors. The alternative
> fix is to replace the multiplication with a constant division
> by 10 loop (this compiles down to an multiplication and shift)
> without needing to make m a long long, but this is slightly slower
> than the fix in this commit when measured on a range of x86
> processors).
>
> Fixes: 646e29a1789a ("x86: Improve the printout of the SMP bootup CPU table")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>
> V2: Make m long long instead of long to fix issue for i386 as well as
>      x86-64
> ---
>   arch/x86/lib/misc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/lib/misc.c b/arch/x86/lib/misc.c
> index 92cd8ecc3a2c..41e26e246d8f 100644
> --- a/arch/x86/lib/misc.c
> +++ b/arch/x86/lib/misc.c
> @@ -8,7 +8,7 @@
>    */
>   int num_digits(int val)

Hi,

num_digits() still has a problem when val = INT_MIN.
  14         if (val < 0) {
  15                 d++;
  16                 val = -val;
                     ^^^^^^^^^^^
When val = INT_MIN, -val still equal to INT_MIN.
Make 'val' long long instead of int to fix this issue.

Su Hui


>   {
> -	int m = 10;
> +	long long m = 10;
>   	int d = 1;
>   
>   	if (val < 0) {

