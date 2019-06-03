Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC0B8325D1
	for <lists+kernel-janitors@lfdr.de>; Mon,  3 Jun 2019 02:51:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbfFCAvV (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 2 Jun 2019 20:51:21 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:50452 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbfFCAvV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 2 Jun 2019 20:51:21 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 10ED6133E9BDB;
        Sun,  2 Jun 2019 17:51:21 -0700 (PDT)
Date:   Sun, 02 Jun 2019 17:51:20 -0700 (PDT)
Message-Id: <20190602.175120.2088142330404607316.davem@davemloft.net>
To:     colin.king@canonical.com
Cc:     aelior@marvell.com, GR-everest-linux-l2@marvell.com,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] qed: remove redundant assignment to rc
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190531132738.17221-1-colin.king@canonical.com>
References: <20190531132738.17221-1-colin.king@canonical.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Sun, 02 Jun 2019 17:51:21 -0700 (PDT)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri, 31 May 2019 14:27:38 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable rc is assigned with a value that is never read and
> it is re-assigned a new value later on.  The assignment is redundant
> and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next.
