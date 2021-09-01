Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 464763FE255
	for <lists+kernel-janitors@lfdr.de>; Wed,  1 Sep 2021 20:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231887AbhIAS1k (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 1 Sep 2021 14:27:40 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40814 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230373AbhIAS1j (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 1 Sep 2021 14:27:39 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: tonyk)
        with ESMTPSA id 924CB1F43FDB
Subject: Re: [PATCH][next] futex: fix assigned ret variable that is never read
To:     Colin King <colin.king@canonical.com>
Cc:     kernel-janitors@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Darren Hart <dvhart@infradead.org>,
        Peter Zijlstra <peterz@infradead.org>
References: <20210818131840.34262-1-colin.king@canonical.com>
From:   =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
Message-ID: <5682c44f-3a02-c2b1-25d3-36db34b00356@collabora.com>
Date:   Wed, 1 Sep 2021 15:26:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210818131840.34262-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Colin,

Às 10:18 de 18/08/21, Colin King escreveu:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the check on the rt_waiter and top_waiter->pi_state is
> assigning an error return code to ret but this later gets re-assigned,
> hence the check is currently ineffective. I believe the original
> intent was to return -EINVAL rather than assign it to ret. Fix this.
> 
> Addresses-Coverity: ("Unused value")
> Fixes: dc7109aaa233 ("futex: Validate waiter correctly in futex_proxy_trylock_atomic()")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>> ---

Reviewed-by: André Almeida <andrealmeid@collabora.com>
