Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C63CC3084F7
	for <lists+kernel-janitors@lfdr.de>; Fri, 29 Jan 2021 06:13:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231966AbhA2FNA (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 29 Jan 2021 00:13:00 -0500
Received: from verein.lst.de ([213.95.11.211]:59979 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231907AbhA2FMz (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 29 Jan 2021 00:12:55 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 4F4AB68AFE; Fri, 29 Jan 2021 06:12:12 +0100 (CET)
Date:   Fri, 29 Jan 2021 06:12:12 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] block: remove typo in kernel-doc of set_disk_ro()
Message-ID: <20210129051212.GB2053@lst.de>
References: <20210129045505.22743-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210129045505.22743-1-lukas.bulwahn@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
