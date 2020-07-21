Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4F92283B4
	for <lists+kernel-janitors@lfdr.de>; Tue, 21 Jul 2020 17:26:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729180AbgGUP0M (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 21 Jul 2020 11:26:12 -0400
Received: from mx2.suse.de ([195.135.220.15]:57104 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726436AbgGUP0L (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 21 Jul 2020 11:26:11 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id F240FAE57;
        Tue, 21 Jul 2020 15:26:16 +0000 (UTC)
Subject: Re: [PATCH][next] x86/ioperm: initialize pointer bitmap with NULL
 rather than 0
To:     Colin King <colin.king@canonical.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        xen-devel@lists.xenproject.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200721100217.407975-1-colin.king@canonical.com>
From:   =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <46011f9b-a5a6-b91c-f8c0-1c106ff5e60e@suse.com>
Date:   Tue, 21 Jul 2020 17:26:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721100217.407975-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 21.07.20 12:02, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer bitmap is being initialized with a plain integer 0,
> fix this by initializing it with a NULL instead.
> 
> Cleans up sparse warning:
> arch/x86/xen/enlighten_pv.c:876:27: warning: Using plain integer
> as NULL pointer
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen
