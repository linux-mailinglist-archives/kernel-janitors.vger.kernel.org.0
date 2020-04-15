Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30BEE1AB426
	for <lists+kernel-janitors@lfdr.de>; Thu, 16 Apr 2020 01:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388796AbgDOXUs (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 15 Apr 2020 19:20:48 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:47038 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388746AbgDOXUq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 15 Apr 2020 19:20:46 -0400
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 0DD71120ED569;
        Wed, 15 Apr 2020 16:20:41 -0700 (PDT)
Date:   Wed, 15 Apr 2020 16:20:38 -0700 (PDT)
Message-Id: <20200415.162038.1967911463518921168.davem@davemloft.net>
To:     colin.king@canonical.com
Cc:     kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, kuba@kernel.org,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ipv6: remove redundant assignment to variable err
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200415231630.1568296-1-colin.king@canonical.com>
References: <20200415231630.1568296-1-colin.king@canonical.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Wed, 15 Apr 2020 16:20:42 -0700 (PDT)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu, 16 Apr 2020 00:16:30 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.
